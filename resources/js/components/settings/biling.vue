<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Updating Your Payment Crypto Wallet..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <div class="tab-pane" id="billing">
            <h6>BILLING SETTINGS</h6>
            <hr>
            <form method="PUT" @submit.prevent="addPaymentMethod">
                <div class="form-group">
                    <label class="d-block mb-0">Payment Method</label>
                    <div v-if="paymentMethod"> {{ paymentMethod }} </div>
                    <div class="row mt-2">
                        <label class="d-block mb-0">Change Wallet</label>
                        <div class="col-md-8"><input type="text" class="form-control" v-model="newWallet"></div>
                    </div>
                    <div class="small text-muted mb-3" v-if="!paymentMethod">You have not added a payment method</div>
                    <div class="py-3">
                        <button class="btn btn-info" type="submit"> {{ switchModeButtonCaption }} </button>
                    </div>
                </div>
                <div class="form-group mb-0">
                    <label class="d-block">Payment History</label>
                    <div v-if="!paymentMethod" class="border border-gray-500 bg-gray-200 p-3 text-center font-size-sm">You have no payments.</div>
                    <div v-else>
                        <div class="py-1" >
                            <h1>Bought</h1>
                        </div>
                        <table class="table table-striped table-light">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Symbol</th>
                                    <th scope="col">Bought Amount</th>
                                    <th scope="col">For</th>
                                    <th scope="col">Used Wallet</th>
                                    <th scope="col">Transaction Data</th>
                                </tr>
                            </thead>
                                <tbody>
                                    <tr v-for="purchases in PurchasesData" :key="purchases.id">
                                        <th scope="row">{{ purchases.id }}</th>
                                        <td scope="row">{{ purchases.crypto_symbol }}</td>
                                        <td scope="row">${{ purchases.bought_amount }}</td>
                                        <td scope="row">${{ purchases.bought_for }}</td>
                                        <td scope="row">{{ purchases.used_wallet }}</td>
                                        <td scope="row">{{ formatDate(purchases.created_at) }}</td>
                                    </tr>
                                </tbody>
                            <div class="py-3">
                                <h1>Sold</h1>
                            </div>
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Symbol</th>
                                    <th scope="col">Sold Amount</th>
                                    <th scope="col">For</th>
                                    <th scope="col">Used Wallet</th>
                                    <th scope="col">Transaction Data</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="sells in SellsData" :key="sells.id">
                                    <th scope="row">{{ sells.id }}</th>
                                    <td scope="row">{{ sells.crypto_symbol }}</td>
                                    <td scope="row">${{ sells.sold_amount }}</td>
                                    <td scope="row">${{ sells.sold_for }}</td>
                                    <td scope="row">{{ sells.used_wallet }}</td>
                                    <td scope="row">{{ formatDate(sells.created_at) }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
    data() {
        return {
            paymentMethod: null,
            newWallet: null,
            error: '',
            isLoading: false,
        }
    },
    created() {
        this.loadWallet();
        this.loadTransactions();
    },
    methods: {
        async addPaymentMethod() {
            if(this.newWallet) {
                this.isLoading = true;
                try {
                    const payload = { wallet: this.newWallet, };

                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/user/changeWallet/'+this.userId, payload, {
                        withCredentials: true,
                    })

                    Toast.fire({
                            icon: 'success',
                            title: 'Profile updated successfully'
                        })
                } catch (error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;
            } else {
                this.error = "Wallet Address Required!"
            }
        },
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        loadWallet() {
            try {
                axios.get('/api/user/loadWallet/'+this.userId)
                .then(({data}) => (this.paymentMethod = data))
            } catch (error) {
                console.log(error);
                this.error = error.message || 'Could not load data. Try again later.'
            }
        },
        handleError() {
            this.error = false;
        },
        async loadTransactions() {
            try {
                await axios.get('/sanctum/csrf-cookie')
                const payload = { userId: this.userId }
                this.$store.dispatch('loadTransactions', payload);

            } catch (error) {
                console.log(error);
                this.error = error.message || 'Could not load data. Try again later.'
            }
        },
    },
    computed: {
        switchModeButtonCaption() {
            if(this.paymentMethod) {
                return 'Change Crypto Wallet';
            } else {
                return 'Add Crypto Wallet';
            }
        },
        ...mapGetters({
            userId: 'userId',
            PurchasesData: 'retrievePurchases',
            SellsData: 'retrieveSells',
            }),
    },
}
</script>

<style scoped>
    h1 {
        color: black;
    }
</style>