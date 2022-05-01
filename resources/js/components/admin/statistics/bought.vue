<template>
    <div>

        <div class="card" style="padding-top: 150px;">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary" @click="hide"><button class="btn btn-primary"> Filters List </button></h6>
            </div>
            <div class="row mt-4" :class="visible ? '' : 'hide'">
                <div class="col text-start">
                    <div class="p-2">
                        <input v-model="searchTermSymbol" type="text" class="col" style="width: 300px;" placeholder="Search By Cryptocurrency Symbol">
                    </div>
                    <div class="p-2">
                        <input v-model="searchTermUserId" type="text" class="col" style="width: 300px;" placeholder="Search By Bought User ID">
                    </div>
                    <div class="p-2">
                        <input v-model="searchTermWallet" type="text" class="col" style="width: 300px;" placeholder="Search By User Wallet">
                    </div>
                </div>
                <div class="col text-center">
                    <div class="p-2">
                        <input v-model="searchTermBoughtA" type="text" class="col" style="width: 300px;" placeholder="Search Bought For From">
                    </div>
                    <div class="p-2">
                        <label for="termDateB" class="label text-start"> From: <input v-model="searchTermDateA" type="date" class="col" style="width: 300px;" placeholder="Search Bought For From"></label>
                    </div>
                </div>
                <div class="col">
                    <i class="fas fa-minus col" style="padding-top: 13px;"></i>
                    <i class="fas fa-minus col" style="padding-top: 52px;"></i>
                </div>
                <div class="col text-end">
                    <div class="p-2">
                        <input v-model="searchTermBoughtB" type="text" class="col" style="width: 300px;" placeholder="Search From Bought For To">
                    </div>
                    <div class="p-2">
                        <label for="termDateB" class="label text-start"> To: <input v-model="searchTermDateB" type="date" class="col" style="width: 300px;" placeholder="Search Bought For From"></label>
                    </div>
                    <div class="p-2">
                        <button class="btn btn-primary btn-lg" @click="searchFilters">Search</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 mb-4">
        <!-- Simple Tables -->
            <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Purchased List</h6>
                    <button class="btn btn-primary text-end btn-sm" @click="Reset">Reset Filters</button>
                </div>
                <table class="table table-striped table-light table-responsive align-items-center table-flush" v-if="purchases.data">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Cryptocurrency Symbol</th>
                            <th>Bought For</th>
                            <th>Bought Amount</th>
                            <th>Used Wallet</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="purchase in filterSearch(purchases.data)" :key="purchase.id">
                            <td> {{ purchase.id }} </td>
                            <td> {{ purchase.user_id }} </td>
                            <td> {{ purchase.crypto_symbol }} </td>
                            <td> ${{ purchase.bought_for }} </td>
                            <td> ${{ purchase.bought_amount }} </td>
                            <td> {{ purchase.used_wallet }} </td>
                            <td> {{ formatDate(purchase.created_at) }} </td>
                        </tr>
                    </tbody>
                    <Pagination :data="purchases" @pagination-change-page="allPurchases" align="center" />
                </table>
                <h1 v-else class="text-center text-dark">Data could not be loaded</h1>

                <div class="card-footer"></div>
            </div>
        </div>
    </div>
</template>

<script>
import LaravelVuePagination from 'laravel-vue-pagination';

export default {
    components: {
        'Pagination': LaravelVuePagination,
    },
    data() {
        return {
            searchTermSymbol: '',
            searchTermUserId: '',
            searchTermWallet: '',
            searchTermBoughtA: '',
            searchTermBoughtB: '',
            searchTermDateA: '',
            searchTermDateB: '',
            purchases: {},
            visible: false,
        }
    },
    mounted() {
        this.allPurchases();
    },
    methods: {
        Reset() {
            this.searchTermSymbol = '';
            this.searchTermUserId = '';
            this.searchTermWallet = '';
            this.searchTermBoughtA = '';
            this.searchTermBoughtB = '';
            this.searchTermDateA = '';
            this.searchTermDateB = '';

            this.allPurchases();
        },
        async allPurchases(page = 1) {
            const response = await axios.get(`/api/admin/purchases?page=${page}`);
            this.purchases = response.data;
        },
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        filterSearch(data) {
            return data
                    .filter(purchase => purchase.crypto_symbol.toLowerCase().indexOf(this.searchTermSymbol.toLowerCase()) > -1)
                    .filter(purchase => purchase.user_id.toString().indexOf(this.searchTermUserId.toLowerCase()) > -1)
                    .filter(purchase => purchase.used_wallet.toString().indexOf(this.searchTermWallet.toLowerCase()) > -1)
        },
        async searchFilters() {

            const payload = {
                boughtA: this.searchTermBoughtA,
                boughtB: this.searchTermBoughtB,
                dateA: this.searchTermDateA,
                dateB: this.searchTermDateB,
            }

            if((this.searchTermBoughtA && this.searchTermBoughtB) || (this.searchTermDateA && this.searchTermDateB)) {
                const response = await axios.post('/api/admin/purchase/search', payload);

                if(response.data.length == 0) {
                    this.purchases = null
                }
                this.purchases = response.data;
            }

        },
        hide() {
            this.visible = !this.visible;
        }
    },
}
</script>

<style scoped>
.pagination{
    margin-bottom: 0;
}

.hide {
    display: none;
}

.input{
    border: 1px solid black;
}

</style>