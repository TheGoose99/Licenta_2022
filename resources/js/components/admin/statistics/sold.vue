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
                        <input v-model="searchTermUserId" type="text" class="col" style="width: 300px;" placeholder="Search By User ID">
                    </div>
                    <div class="p-2">
                        <input v-model="searchTermWallet" type="text" class="col" style="width: 300px;" placeholder="Search By Used Wallet">
                    </div>
                    <div class="p-2">
                        <input v-model="searchTermSellCode" type="text" class="col" style="width: 300px;" placeholder="Search By Sell Code">
                    </div>
                </div>
                <div class="col text-center">
                    <div class="p-2">
                        <input v-model="searchTermBoughtA" type="text" class="col" style="width: 300px;" placeholder="Search Cost - From">
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
                        <input v-model="searchTermBoughtB" type="text" class="col" style="width: 300px;" placeholder="Search Cost - To">
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
                    <h6 class="m-0 font-weight-bold text-primary">Sells List</h6>
                    <button class="btn btn-primary text-end btn-sm" @click="Reset">Reset Filters</button>
                </div>
                <table class="table table-striped table-light table-responsive align-items-center table-flush" v-if="sells.data">
                    <thead class="thead-light">
                        <tr>
                            <th @click="sort('id')">ID <div class="fa fa-sort"></div></th>
                            <th @click="sort('user_id')">User ID <div class="fa fa-sort"></div></th>
                            <th @click="sort('crypto_symbol')">Cryptocurrency Symbol <div class="fa fa-sort"></div></th>
                            <th @click="sort('sell_code')">Sell Code <div class="fa fa-sort"></div></th>
                            <th @click="sort('sold_for')">Cost <div class="fa fa-sort"></div></th>
                            <th @click="sort('sold_amount')">Sold Amount <div class="fa fa-sort"></div></th>
                            <th @click="sort('used_wallet')">Used Wallet <div class="fa fa-sort"></div></th>
                            <th @click="sort('created_at')">Date <div class="fa fa-sort"></div></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="sell in sortedSells" :key="sell.id">
                            <td> {{ sell.id }} </td>
                            <td> {{ sell.user_id }} </td>
                            <td> {{ sell.crypto_symbol }} </td>
                            <td> {{ sell.sell_code }} </td>
                            <td> ${{ sell.sold_for }} </td>
                            <td> ${{ sell.sold_amount }} </td>
                            <td> {{ sell.used_wallet }} </td>
                            <td> {{ formatDate(sell.created_at) }} </td>
                        </tr>
                    </tbody>
                    <Pagination :data="sells" @pagination-change-page="allSells" align="center" />
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
            searchTermSellCode: '',
            searchTermBoughtA: '',
            searchTermBoughtB: '',
            searchTermDateA: '',
            searchTermDateB: '',
            sells: {},
            visible: false,
            currentSort:'name',
            currentSortDir:'asc',
        }
    },
    mounted() {
        this.allSells();
    },
    methods: {
        Reset() {
            this.searchTermSymbol = '';
            this.searchTermUserId = '';
            this.searchTermWallet = '';
            this.searchTermSellCode = '';
            this.searchTermBoughtA = '';
            this.searchTermBoughtB = '';
            this.searchTermDateA = '';
            this.searchTermDateB = '';

            this.allSells();
        },
        async allSells(page = 1) {
            const response = await axios.get(`/api/admin/sells?page=${page}`);
            this.sells = response.data;
        },
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        filterSearch(data) {
            return data
                    .filter(sell => sell.crypto_symbol.toLowerCase().indexOf(this.searchTermSymbol.toLowerCase()) > -1)
                    .filter(sell => sell.user_id.toString().indexOf(this.searchTermUserId.toLowerCase()) > -1)
                    .filter(sell => sell.used_wallet.toString().indexOf(this.searchTermWallet.toLowerCase()) > -1)
                    .filter(sell => sell.sell_code.toString().indexOf(this.searchTermSellCode.toLowerCase()) > -1)
        },
        async searchFilters() {

            const payload = {
                soldA: this.searchTermBoughtA,
                soldB: this.searchTermBoughtB,
                dateA: this.searchTermDateA,
                dateB: this.searchTermDateB,
            }

            if((this.searchTermBoughtA && this.searchTermBoughtB) || (this.searchTermDateA && this.searchTermDateB)) {
                const response = await axios.post('/api/admin/sell/search', payload);

                if(response.data.length == 0) {
                    this.sells = null
                }
                this.sells = response.data;
            }

        },
        hide() {
            this.visible = !this.visible;
        },
        sort:function(s) {
            //if s == current sort, reverse
            if(s === this.currentSort) {
            this.currentSortDir = this.currentSortDir==='asc'?'desc':'asc';
            }
            this.currentSort = s;
        }
    },
    computed:{
        sortedSells:function() {
            return this.filterSearch(this.sells.data).sort((a,b) => {
                let modifier = 1;
                if(this.currentSortDir === 'desc') modifier = -1;
                if(a[this.currentSort] < b[this.currentSort]) return -1 * modifier;
                if(a[this.currentSort] > b[this.currentSort]) return 1 * modifier;
                return 0;
            });
        }
    }
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