<template>
    <h1 class="text-dark">Sold Crypto Transactions History</h1>
    <div class="py-3" >
        <router-link to="/profile/biling"><button class="btn btn-primary btn-lg">Back</button></router-link>
    </div>
    <table class="table table-striped table-light">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Symbol</th>
                <th scope="col">Sell Code</th>
                <th scope="col">Sold Amount</th>
                <th scope="col">Cost</th>
                <th scope="col">Used Wallet</th>
                <th scope="col">Transaction Data</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="sells in SellsData.data" :key="sells.id">
                <th scope="row">{{ sells.id }}</th>
                <td scope="row">{{ sells.crypto_symbol }}</td>
                <td scope="row">{{ sells.sell_code }}</td>
                <td scope="row">${{ sells.sold_amount }}</td>
                <td scope="row">${{ sells.sold_for }}</td>
                <td scope="row">{{ sells.used_wallet }}</td>
                <td scope="row">{{ formatDate(sells.created_at) }}</td>
            </tr>
        </tbody>
        <Pagination :data="SellsData" @pagination-change-page="loadSells" align="center" />
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
            SellsData: [],
        }
    },
    mounted () {
        this.loadSells();
    },
    methods: {
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        async loadSells(page = 1) {
            try {
                await axios.get('/sanctum/csrf-cookie')
                const response = await axios.get('/api/sells/user/' + this.userId + `?page=${page}`);
                const responseData = response.data;
                this.SellsData = responseData;
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