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
                                    <tr v-for="crypto in filterSearch" :key="crypto.id" @click="setSelectedCryptoCoin(crypto.name, crypto.current_price, crypto.symbol, crypto.image)">
                                        <th scope="row"><img :src="crypto.image" alt="Crypto" id="em_photo"></th>
                                        <td scope="row"><b>{{ crypto.name }}</b></td>
                                        <td scope="row">{{ crypto.symbol }}</td>
                                        <td scope="row">${{ crypto.current_price.toFixed(2) }}</td>
                                        <td scope="row" :class="[PercentageColor(crypto.price_change_percentage_24h) ? 'text-success' : 'text-danger']">{{ crypto.price_change_percentage_24h.toFixed(3) }}%</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p v-else class="text-center">Could Not Find Cryptocurrency</p>
                        </div>
                    </div>
                </div>
            </div>
        </base-dialog>

        <div class="text-center">
            <base-card>
                <div class="row mt-4">
                    <h1 class="col text-dark"> Buy crypto from vendor </h1>
                </div>

                <form @submit.prevent="addToStocks">
                    <div class="row">
                        <div class="m-3 text-center">
                            <h6 v-if="retrieveselectedCrypto"> 1 {{ retrieveselectedCrypto }} ≈ {{ retrieveselectedCryptoAmount }} USD</h6>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="row">
                            <div class="col">
                                <label class="mb-3 text-center" for="spendAmount">Enter Your Amount:</label>
                                <div class="form-control mb-3">
                                    <input type="number"
                                        placeholder="Enter an amount..."
                                        v-model="spendAmount"
                                        @keyup="dealAmount()"
                                        >
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="input-group mb-3">
                                <label class="mb-3" for="spendAmount">You receive:</label>
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

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success text-center btn-lg" style="border: 1px black solid;">Restock</button>
                        </div>

                    </div>

                    <div class="row mt-4">
                        <div class="col text-start">
                            <router-link :to="{ name: 'dashboard' }"><button class="btn btn-primary" id="buttons">Back</button></router-link>
                        </div>
                        <div class="col text-end">
                            <button type="button" @click="toggleDialogue" class="btn btn-warning" id="buttons">Select</button>
                        </div>
                    </div>

                </form>
            </base-card>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import loadData from '../../mixins/cryptoMixins/loadData.js';

export default {
    mixins: [loadData],
    data() {
        return {
            open: false,
            spendAmount: '',
            receiveAmount: 0,
            crypto_image: '',
        }
    },
    mounted() {
        const payload = {
                orderType: 'market_cap_desc',
                perPage: 100,
                currentPage: this.currentPage,
            }

        this.$store.dispatch('highestCrypto', payload);
    },
    methods: {
        toggleDialogue() {
            this.open = !this.open;
        },
        dealAmount() {
            if(this.retrieveselectedCryptoAmount) {
                this.receiveAmount = this.spendAmount / this.retrieveselectedCryptoAmount;
            } else {
                this.open = true;
                this.spendAmount = 0;
            }

            if(this.receiveAmount) {
                return this.receiveAmount = this.receiveAmount.toFixed(5).replace(/[.,]00000$/, "");
            } else {
                return this.receiveAmount = 0;
            }
        },
        setSelectedCryptoCoin(name, price, cryptoSymbol, cryptoImage) {

            this.crypto_image = cryptoImage;

            const payload = { name, price, cryptoSymbol }

            this.$store.dispatch('cryptoAssignment', payload);

            this.open = false;
        },
        async addToStocks() {
            if (this.retrieveselectedCrypto && this.retrieveselectedCryptoAmount) {

                const payload = {
                    name: this.retrieveselectedCrypto,
                    crypto: this.retrieveselectedCryptoSymbol,
                    amount: this.retrieveselectedCryptoAmount,
                    for: this.spendAmount,
                    image: this.crypto_image,
                }

                try {
                    await this.$store.dispatch('buy_stocks', payload);

                    Toast.fire({
                        icon: 'success',
                        title: 'Transaction made successfully'
                    })

                    await this.$router.replace('/admin');

                } catch(error) {
                    console.log(error);
                    this.error = 'Failed to finish the transactions. Try again later...'
                }
            } else {
                this.open = true;
            }
        },
    },
    computed: {
        ...mapGetters([
            'retrieveselectedCrypto',
            'retrieveselectedCryptoAmount',
            'retrieveselectedCryptoSymbol',
        ]),
    },
}
</script>

<style scoped>
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
        width: 420px;
    }

    #buttons {
        width: 160px;
        border: 1px black solid;
    }
</style>