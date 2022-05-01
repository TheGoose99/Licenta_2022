<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Updating Your Crypto Data..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <h6>YOUR CRYPTO DATA INFORMATION</h6>
        <hr>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-9 border-right">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Edit Crypto Data</h4>
                    </div>
                    <form method="PUT" @submit.prevent="updateData">
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" v-model="form.name"></div>
                            <div class="col-md-6"><label class="labels">Symbol</label><input type="text" class="form-control" v-model="form.symbol"></div>
                            <div class="col-md-6"><label class="labels">Bought Price</label><input type="text" class="form-control" v-model="form.bought_price"></div>
                            <div class="col-md-6"><label class="labels">Volume</label><input type="text" class="form-control" v-model="form.volume"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Date</label><input type="text" class="form-control" :value="form.created_at" v-model="form.created_at"></div>
                            <div class="col-md-6"><label class="labels">Image</label><img type="text" :src="form.image" style="width: 140px; height: 150px;"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6 text-start"><router-link :to="{ name: 'stocks' }"><button class="btn btn-danger profile-button btn-sm" @click="emitRoute('users')">Back</button></router-link></div>
                            <div class="col-md-6 text-center"><button class="btn btn-primary profile-button btn-sm" type="submit">Save Profile</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
    data () {
        return {
            form: {
                name: '',
                symbol: '',
                image: '',
                bought_price: '',
                volume: '',
                created_at: '',
            },
            error: '',
            isLoading: false,
        }
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {

            let url = '/api/admin/stock/';

            const response = await axios.get(url + this.userId);

            this.form = await response.data;

            if(!response.statusText) {
                const error = new Error(
                    responseData.message || 'Failed to load Data.'
                );
            throw error;
            }

        },
        async updateData() {

                this.isLoading = true;

                try {

                    const payload = {
                        name: this.form.name,
                        symbol: this.form.symbol,
                        amount: this.form.volume,
                        for: this.form.bought_price,
                        image: this.form.image,
                        date: this.form.created_at,
                    }

                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/admin/stock/' + this.userId, payload, {
                        withCredentials: true,
                    })

                    Toast.fire({
                            icon: 'success',
                            title: 'Cryptocurrency updated successfully'
                        })

                    this.$router.replace({ name: 'stocks' });

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;

        },
        handleError() {
            this.error = false;
        },
        emitRoute(payload) {
            this.$store.commit('setComponent', payload);
        },
    },
    computed:{
        ...mapGetters({userId: 'getSelectedId'}),
    },
}
</script>

<style scoped>

    select,
    select > option
    {
        width: 200px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
    }
</style>