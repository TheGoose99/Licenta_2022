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
                    <div class="row py-3">
                        <div class="col-md-6">
                            <router-link to="/profile/biling/purchases"><button class="btn btn-primary btn-lg">Purchases History</button></router-link>
                        </div>
                        <div class="col">
                            <router-link to="/profile/biling/sells"><button class="btn btn-danger btn-lg">Sells History</button></router-link>
                        </div>
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
    mounted () {
        this.loadWallet();
    },
    methods: {
        async addPaymentMethod() {
            if(this.newWallet) {
                this.isLoading = true;
                try {
                    const payload = { wallet: this.newWallet, };

                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/user/changeWallet/' + this.userId, payload, {
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
        loadWallet() {
            try {
                axios.get('/api/user/loadWallet/' + this.userId)
                .then(({data}) => {this.paymentMethod = data})
            } catch (error) {
                console.log(error);
                this.error = error.message || 'Could not load data. Try again later.'
            }
        },
        handleError() {
            this.error = false;
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
        }),
    },
}
</script>

<style scoped>
    h1 {
        color: black;
    }
</style>