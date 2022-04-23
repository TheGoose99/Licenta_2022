<template>
    <div>
        <div class="card">
            <div class="form-group">
                <div class="p-3">
                    <div class="text-start">
                        <input v-model="searchTerm" type="text" class="form-control" style="width: 300px;" placeholder="Search Here">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 mb-4">
        <!-- Simple Tables -->
            <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Users List</h6>
                </div>
                <table class="table table-striped table-light table-responsive align-items-center table-flush" :showRepos="showRepos">
                    <thead class="thead-light">
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Country</th>
                            <th>Wallet</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user in filterSearch" :key="user.id">
                            <td> {{ user.username }} </td>
                            <td> {{ user.name }} </td>
                            <td> {{ user.email }} </td>
                            <td> {{ user.phone }} </td>
                            <td> {{ user.address }} </td>
                            <td> {{ user.country_id }} </td>
                            <td> {{ user.wallet }} </td>
                            <td>
                                <router-link :to="{ path: '/profile/edit-user/'+ user.id }"><button @click="emitId(user.id)" class="btn btn-sm btn-success">Edit</button></router-link>
                                <button @click="deleteUser(user.id)" class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <ul class="pagination justify-content-center">
                    <li class="page-item" :class="currentPage == 1 ? 'disabled' : ''" @click="changePage(currentPage - 1)">
                        <button class="page-link" href="#">Previous</button>
                    </li>
                    <!-- <li class="page-item" :class="currentPage == 1 ? 'disabled' : ''"><button class="page-link" @click="changePage(1)">1</button></li>
                    <li class="page-item" :class="currentPage == 2 ? 'disabled' : ''"><button class="page-link" @click="changePage(2)">2</button></li>
                    <li class="page-item" :class="currentPage == 3 ? 'disabled' : ''"><button class="page-link" @click="changePage(3)">3</button></li>
                    <li class="page-item" :class="currentPage == 4 ? 'disabled' : ''"><button class="page-link" @click="changePage(4)">4</button></li> -->
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
        this.allUsers();
    },
    data() {
        return {
            users: [],
            searchTerm: '',
            currentPage: 1,
            perPage: 5,
        }
    },
    methods: {
        allUsers() {
            axios.get('/api/admin/user')
            .then((response) => {
                this.users = response.data
                    this.users.forEach(function(user) {
                        if(user.country_id) {
                            axios.get('/api/countryName/' + user.country_id)
                                .then(({data}) => (user.country_id = data));
                        } else {
                            user.country_id = "no country";
                        }

                        if(!user.address) {
                            user.address = "no address";
                        }

                        if(!user.phone) {
                            user.phone = "no phone";
                        }

                        if(!user.wallet) {
                            user.wallet = "no wallet";
                        }

                        if(!user.name) {
                            user.name = "no name";
                        }
                    })
                })
            .catch()
        },
        deleteUser(id) {
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
                axios.delete('/api/admin/user/'+id)
                .then(() => {
                    this.users = this.users.filter(user => {
                        return user.id != id;
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
                if(this.showRepos.length < 5) {
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
        }
    },
    computed: {
        filterSearch() {
            return this.showRepos.filter(user => {
                return user.username.match(this.searchTerm)
            })
        },
        showRepos() {
            let start = (this.currentPage - 1) * this.perPage;
            let end = start + this.perPage;

            return this.users.slice(start, end);
        },
    },
}
</script>

<style scoped>

</style>