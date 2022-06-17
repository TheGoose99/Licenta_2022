<template>
    <div>
        <div class="card" style="padding-top: 200px;">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Filters List</h6>
            </div>
            <div class="row mt-6">
                <div class="col text-start p-3">
                    <input v-model="searchTermName" type="text" class="col" style="width: 300px;" placeholder="Search By Name">
                </div>
                <div class="col text-center p-3">
                    <input v-model="searchTermBoughtFor" type="number" class="col" style="width: 300px;" placeholder="Search By Bought Amount">
                </div>
                <div class="col text-end p-3">
                    <input v-model="searchTermVolume" type="number" class="col" style="width: 300px;" placeholder="Search By Volume">
                </div>
            </div>
        </div>

        <div class="col-lg-12 mb-4">
        <!-- Simple Tables -->
            <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Stocks List</h6>
                    <button class="btn btn-primary text-end btn-sm" @click="Reset">Reset Filters</button>
                </div>
                <table class="table table-striped table-light table-responsive align-items-center table-flush" v-if="stocks.data">
                    <thead class="thead-light">
                        <tr>
                            <th @click="sort('id')">ID</th>
                            <th @click="sort('name')">Name</th>
                            <th @click="sort('symbol')">Symbol</th>
                            <th>Image</th>
                            <th @click="sort('bought_price')">Bought For</th>
                            <th @click="sort('volume')">Volume</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="stock in sortedStocks" :key="stock.id">
                            <td> {{ stock.id }} </td>
                            <td> {{ stock.name }} </td>
                            <td> {{ stock.symbol }} </td>
                            <th scope="row"><img :src="stock.image" alt="Stock" id="em_photo"></th>
                            <td> ${{ stock.bought_price }} </td>
                            <td> {{ stock.volume }} </td>
                            <td>
                                <router-link :to="{ path: '/admin/edit-stock/' + stock.id }"><button @click="emitId(stock.id)" class="btn btn-sm btn-success">Edit</button></router-link>
                                <button @click="deleteStock(stock.id)" class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                    <ul class="pagination justify-content-center">
                        <Pagination :data="stocks" @pagination-change-page="allStocks"/>
                    </ul>
                </table>
                <h1 class="text-center text-dark" v-else>Data could not be loaded</h1>
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
    mounted() {
        this.allStocks();
    },
    data() {
        return {
            stocks: [],
            searchTermName: '',
            searchTermVolume: '',
            searchTermBoughtFor: '',
            isLoading: false,
            currentSort:'name',
            currentSortDir:'asc'
        }
    },
    methods: {
        async allStocks(page = 1) {
            this.statusSpinner();
            const response = await axios.get(`/api/admin/stock?page=${page}`)

            this.stocks = response.data;
            this.statusSpinner();
        },
        deleteStock(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
            if (result.value) {
                axios.delete('/api/admin/stock/' + id)
                .then(() => {
                    this.stocks = this.stocks.filter(stock => {
                        return stock.id != id;
                    });
                })

            Swal.fire(
                'Deleted!',
                'Your user has been deleted.',
                'success'
                )
            }
            })
        },
        emitId(id) {
            this.$store.commit('AssignId', id);
        },
        Reset() {
            this.searchTermName = '';
            this.searchTermVolume = '';
            this.searchTermBoughtFor = '';
        },
        statusSpinner() {
            this.isLoading = !this.isLoading;
        },
        filterSearch(data) {
            return data
                    .filter(stock => stock.name.toLowerCase().indexOf(this.searchTermName.toLowerCase()) > -1)
                    .filter(stock => stock.bought_price.toString().indexOf(this.searchTermBoughtFor) > -1)
                    .filter(stock => stock.volume.toString().indexOf(this.searchTermVolume) > -1)
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
        sortedStocks:function() {
            return this.filterSearch(this.stocks.data).sort((a,b) => {
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
#em_photo {
        height: 40px;
        width: 40px;
    }

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>