<template>
    <h1 class="text-dark">Bought Crypto Transactions History</h1>
    <div class="py-3" >
        <router-link to="/profile/biling"><button class="btn btn-primary btn-lg">Back</button></router-link>
    </div>
    <table class="table table-striped table-light">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Crypto Symbol</th>
                <th scope="col">Purchase Code</th>
                <th scope="col">Bought Amount</th>
                <th scope="col">Cost</th>
                <th scope="col">Used Wallet</th>
                <th scope="col">Transaction Data</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="purchases in PurchasesData.data" :key="purchases.id">
                <th scope="row">{{ purchases.id }}</th>
                <td scope="row">{{ purchases.crypto_symbol }}</td>
                <td scope="row">{{ purchases.purchase_code }}</td>
                <td scope="row">${{ purchases.bought_amount }}</td>
                <td scope="row">${{ purchases.bought_for }}</td>
                <td scope="row">{{ purchases.used_wallet }}</td>
                <td scope="row">{{ formatDate(purchases.created_at) }}</td>
            </tr>
        </tbody>
        <Pagination :data="PurchasesData" @pagination-change-page="loadPurchases" align="center" />
    </table>
</template>

<script>
import { mapGetters } from 'vuex'
import LaravelVuePagination from 'laravel-vue-pagination';

export default {
    components: {
        'Pagination': LaravelVuePagination,
    },
    data() {
        return {
            error: '',
            PurchasesData: [],
        }
    },
    mounted () {
        this.loadPurchases();
    },
    methods: {
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        async loadPurchases(page = 1) {
            try {
                await axios.get('/sanctum/csrf-cookie')
                const response = await axios.get('/api/purchases/user/' + this.userId + `?page=${page}`);
                const responseData = response.data;
                this.PurchasesData = responseData;
            } catch (error) {
                console.log(error);
                this.error = error.message || 'Could not load data. Try again later.'
            }
        },
    },
    computed: {
        ...mapGetters({
            userId: 'userId',
        }),
    },
}
</script>

<style scoped>

</style>