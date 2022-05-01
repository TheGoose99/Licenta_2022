<template>
    <div>
        <div class="card">
            <div class="row mt-4">
                <div class="col text-start">
                    <input v-model="searchTermName" type="text" class="col" style="width: 300px;" placeholder="Search By Name">
                </div>
                <div class="col text-center">
                    <input v-model="searchTermBoughtFor" type="text" class="col" style="width: 300px;" placeholder="Search By Bought Amount">
                </div>
                <div class="col text-end">
                    <input v-model="searchTermVolume" type="text" class="col" style="width: 300px;" placeholder="Search By Volume">
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
                <table class="table table-striped table-light table-responsive align-items-center table-flush" :showRepos="showRepos" v-if="filterSearch.length">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Symbol</th>
                            <th>Image</th>
                            <th>Bought For</th>
                            <th>Volume</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="stock in filterSearch" :key="stock.id">
                            <td> {{ stock.id }} </td>
                            <td> {{ stock.name }} </td>
                            <td> {{ stock.symbol }} </td>
                            <th scope="row"><img :src="stock.image" alt="Stock" id="em_photo"></th>
                            <td> {{ stock.bought_price }} </td>
                            <td> {{ stock.volume }} </td>
                            <td>
                                <router-link :to="{ path: '/profile/edit-stock/'+ stock.id }"><button @click="emitId(stock.id)" class="btn btn-sm btn-success">Edit</button></router-link>
                                <button @click="deleteStock(stock.id)" class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <h1 class="text-center text-dark" v-else>Data could not be loaded</h1>
                <ul class="pagination justify-content-center">
                    <li class="page-item" :class="currentPage == 1 ? 'disabled' : ''" @click="changePage(currentPage - 1)">
                        <button class="page-link" href="#">Previous</button>
                    </li>
                    <li class="page-item" :class="!lastPage ? 'disabled' : ''">
                        <button class="page-link" @click="changePage(currentPage + 1)">Next</button>
                    </li>
                </ul>
                <div class="card-footer"></div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    mounted() {
        this.allStocks();
    },
    data() {
        return {
            stocks: [],
            searchTermName: '',
            searchTermVolume: '',
            searchTermBoughtFor: '',
            currentPage: 1,
            perPage: 25,
            isLoading: false,
        }
    },
    methods: {
        async allStocks() {
            this.statusSpinner();
            const response = await axios.get('/api/admin/stock')

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
        changePage(number) {
            if(number > 0) {
                if(this.showRepos.length < 25) {
                    this.currentPage = 1;
                } else {
                    this.currentPage = number;
                }
            }
        },
        lastPage() {
            if(this.showRepos.length < 5) {
                return true;
            }
            return false;
        },
        Reset() {
            this.searchTermName = '';
            this.searchTermVolume = '';
            this.searchTermBoughtFor = '';
        },
        statusSpinner() {
            this.isLoading = !this.isLoading;
        }
    },
    computed: {
        // !!Erorile din console log sunt ca rezultat a functiei computed "filterSearch" care cauta de cand au fost incarcate datele, rolurile, insa deoarece se incarca mai
        //pe urma, nu le gaseste in mod initial si spune ca e o "Eroare"!!
        filterSearch() {
            return this.showRepos
                    .filter(stock => stock.name.toLowerCase().indexOf(this.searchTermName.toLowerCase()) > -1)
                    .filter(stock => stock.bought_price.toString().indexOf(this.searchTermBoughtFor.toLowerCase()) > -1)
                    .filter(stock => stock.volume.toString().indexOf(this.searchTermVolume.toLowerCase()) > -1)
        },
        showRepos() {
            let start = (this.currentPage - 1) * this.perPage;
            let end = start + this.perPage;

            return this.stocks.slice(start, end);
        },
    },
}
</script>

<style scoped>
#em_photo {
        height: 40px;
        width: 40px;
    }
</style>