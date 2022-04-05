<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
            <p> {{ error }}  </p>
        </base-dialog>

        <base-dialog :show="open" @close="toggleDialogue">
            <div class="input-group">
                <input class="form-control border-end-0 border" type="search" placeholder="Search" id="myInput" style="color: gray" v-model="searchTerm">
                <span class="input-group-append">
                    <button class="btn btn-outline-secondary bg-white border-start-0 border-bottom-0 border ms-n5" type="button" @click="filterSearch">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col">
                        <div class="p-3">
                            <h4>Select a coin:</h4>
                        </div>
                        <div class="wrapper">
                            <table class="table" v-if="filterSearch.length" style="display: inline-block; overflow: auto;">
                                <tbody>
                                    <tr v-for="crypto in filterSearch" :key="crypto.id" @click="setSelectedCryptoCoin(crypto.name, crypto.current_price, crypto.symbol)">
                                        <th scope="row"><img :src="crypto.image" alt="Crypto" id="em_photo"></th>
                                        <td scope="row"><b>{{ crypto.name }}</b></td>
                                        <td scope="row">{{ crypto.symbol }}</td>
                                        <td scope="row">${{ crypto.current_price.toFixed(2) }}</td>
                                        <td scope="row" :class="[PercentageColor(crypto.price_change_percentage_24h) ? 'text-success' : 'text-danger']">{{ crypto.price_change_percentage_24h.toFixed(3) }}%</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p v-else class="text-center">Could Not Find Cryptocurrency</p>
                            <p v-if="spendAmount == 0" class="text-center" style="color: red"><b>You need to first select a Cryptocurrency</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </base-dialog>

        <div class="col">

            <div class="text-center">
                <base-badge :title="switchMode()" :class="'option3'"></base-badge>
            </div>
            <div class="row">
                <div class="m-3 text-center">
                    <h6 v-if="retrieveselectedCrypto"> 1 {{ retrieveselectedCrypto }} ≈ {{ retrieveselectedCryptoAmount }} USD</h6>
                    <button class="btn btn-warning rounded-circle" @click="toggleMode"><i class="fa-solid fa-right-left"></i></button>
                </div>
            </div>

            <base-card id="baseCard">
                <form @submit.prevent="verifyTransactionData">
                    <div class="row">
                        <div class="col">
                            <label for="spendAmount">Enter Your Amount:</label>
                            <div class="form-control mb-3">
                                <input type="number"
                                    placeholder="$10 - $15000"
                                    v-model="spendAmount"
                                    @keyup="dealAmount()"
                                    min="10"
                                    max="15000"
                                    >
                            </div>
                        </div>
                    </div>
                    <base-badge v-if="badAmount" title="Can't order > $1.000.000 in crypto & over $15.000!" :class="'option4'" style="font-size: 10.7px; padding: 10px;"></base-badge>
                    <div class="row">
                        <div class="col">
                            <div class="input-group mb-3">
                            <label for="spendAmount">You receive:</label>
                                <div class="input-group">
                                    <input type="number"
                                        v-model="receiveAmount"
                                        placeholder="0.00"
                                        min="1"
                                        max="100000"
                                        readonly
                                        >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-auto">
                        <div class="text-end">
                            <button class="btn btn-success">Make Transaction</button>
                        </div>
                    </div>
                </form>

                <div class="col">
                    <div class="text-right">
                        <button @click="toggleDialogue" class="btn btn-warning" id="btn">Select a currency</button>
                    </div>
                </div>
            </base-card>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import BaseBadge from '../../components/ui/BaseBadge.vue';
import loadData from '../mixins/cryptoMixins/loadData.js';

export default {
    components: {
        BaseBadge,
    },
    data() {
        return {
            open: false,
            spendAmount: '',
            receiveAmount: 0,
            badAmount: false,
            mode: true,
        }
    },
    mixins: [loadData],
    created() {
        document.body.style.backgroundColor = "#ffffff";

        const payload = {
                orderType: 'market_cap_desc',
                perPage: 100,
                currentPage: this.currentPage,
            }

        this.$store.dispatch('highestCrypto', payload);
    },
    computed: {
        ...mapGetters([
            'retrieveselectedCrypto',
            'retrieveselectedCryptoAmount',
            'retrieveselectedCryptoSymbol',
        ]),
    },
    methods: {
        toggleDialogue() {
            this.open = !this.open;
        },
        setSelectedCryptoCoin(name, price, cryptoSymbol) {

            const payload = { name, price, cryptoSymbol }

            this.$store.dispatch('cryptoAssignment', payload);

            this.open = false;
        },
        dealAmount() {

            if(this.retrieveselectedCryptoAmount && this.mode) {
                this.receiveAmount = this.spendAmount / this.retrieveselectedCryptoAmount;
            } else if(this.retrieveselectedCryptoAmount && !this.mode) {
                this.receiveAmount = this.spendAmount * this.retrieveselectedCryptoAmount;
            } else {
                this.open = true;
                this.spendAmount = 0;
            }

            if(this.receiveAmount) {
                return this.receiveAmount = this.receiveAmount.toFixed(3);
            } else {
                return this.receiveAmount = 0;
            }
        },
        async verifyTransactionData() {
            if (this.retrieveselectedCrypto && this.retrieveselectedCryptoAmount && this.spendAmount >= 10 && this.receiveAmount <= 1000000) {

                const payload = {
                    crypto: this.retrieveselectedCryptoSymbol,
                    amount: this.retrieveselectedCryptoAmount,
                    for: this.spendAmount,
                }

                try {
                    if(this.mode) {
                        await this.$store.dispatch('buy', payload);
                    } else {
                        await this.$store.dispatch('sell', payload);
                    }

                    Toast.fire({
                        icon: 'success',
                        title: 'Transaction made successfully'
                    })

                    await this.$router.replace('/market');

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Failed to finish the transaction. Try again later.'
                }

            } else {
                this.badAmount = true;
                this.open = true;
            }
        },
        switchMode() {
            if(this.mode) {
                return 'Buy Crypto';
            } else {
                return 'Sell Crypto';
            }
        },
        toggleMode() {
            this.spendAmount = 0;
            this.receiveAmount = 0;
            this.mode = !this.mode;
        },
    },
    unmounted: function () {
        document.body.style.backgroundColor = "#181a20";
    },

}
</script>

<style scoped>
    h3, h6 {
        color: black;
    }

    #em_photo {
        height: 40px;
        width: 40px;
    }

    #wrapper {
        width: 280px;
    }

    table {
        width: 100%;
    }

    th, td {
        width: 320px;
    }

    tr:hover {
        background-color: #F7931A;
    }

    tbody {
        display: block;
        height: 200px;
        overflow: auto;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
    -webkit-appearance: none;
        margin: 0;
    }

    input {
        width: 310px;
        border: none;
        border-color: transparent;
    }

    input:focus, textarea:focus, select:focus{
        outline: none;
    }

    #baseCard {
        width: 360px;
    }

    #btn {
        border: 1px solid black;
        margin-top: -65px;
    }

</style>