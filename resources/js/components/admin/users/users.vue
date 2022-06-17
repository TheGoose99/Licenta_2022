<template>
    <div>
        <div class="card" style="padding-top: 360px;">
            <div class="row mt-4">
                <div class="col text-start">
                    <input v-model="searchTermName" type="text" class="col" style="width: 300px;" placeholder="Search By Name">
                </div>
                <div class="col-auto">
                    <label for="countries">Search By Country </label>
                    <select v-model="searchTermCountry">
                        <option v-for="country in countries" :key="country.id"> {{ country.country_name }} </option>
                    </select>
                </div>
                <div class="col text-end">
                    <label for="countries">Search By Role </label>
                    <select v-model="searchTermRole">
                        <option v-for="role in roles" :key="role.id"> {{ role.name }} </option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-lg-12 mb-4">
        <!-- Simple Tables -->
            <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Users List</h6>
                    <button class="btn btn-primary text-end btn-sm" @click="Reset">Reset Filters</button>
                </div>
                <table class="table table-striped table-light table-responsive align-items-center table-flush" v-if="users.data">
                    <thead class="thead-light">
                        <tr>
                            <th @click="sort('id')">ID</th>
                            <th @click="sort('username')">Username</th>
                            <th @click="sort('name')">Name</th>
                            <th @click="sort('email')">Email</th>
                            <th @click="sort('phone')">Phone</th>
                            <th @click="sort('address')">Address</th>
                            <th @click="sort('country_id')">Country</th>
                            <th @click="sort('wallet')">Wallet</th>
                            <th @click="sort('role')">Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user in sortedUsers" :key="user.id">
                            <td> {{ user.id }} </td>
                            <td> {{ user.username }} </td>
                            <td> {{ user.name }} </td>
                            <td> {{ user.email }} </td>
                            <td> {{ user.phone }} </td>
                            <td> {{ user.address }} </td>
                            <td> {{ user.country_id }} </td>
                            <td> {{ user.wallet }} </td>
                            <td> <base-badge :title= user.role :class="colorRole(user.role)" style="width: 100px; height: 35px; font-size: 16px;"> </base-badge></td>
                            <td>
                                <router-link :to="{ path: '/admin/edit-user/'+ user.id }"><button @click="emitId(user.id)" class="btn btn-sm btn-success">Edit</button></router-link>
                                <button @click="deleteUser(user.id)" class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                    <ul class="pagination justify-content-center">
                        <Pagination :data="users" @pagination-change-page="allUsers" align="center" />
                    </ul>
                </table>
                <h1 class="text-center text-dark" v-else>User could not be found</h1>
                <div class="text-center">
                    <div class="spinner-border text-primary" role="status" v-if="isLoading">
                        <span class="sr-only">Page Is Loading...</span>
                    </div>
                </div>
                <div class="card-footer"></div>
            </div>
        </div>
    </div>
</template>

<script>
import BaseBadge from '../../ui/BaseBadge.vue';
import LaravelVuePagination from 'laravel-vue-pagination';

export default {
    components: {
        BaseBadge,
        'Pagination': LaravelVuePagination,
    },
    mounted() {
        axios.get('/api/countries')
            .then(({data}) => (this.countries = data))
            .then(axios.get('/api/admin/roles')
            .then(({data}) => (this.roles = data)));

        this.allUsers();
    },
    data() {
        return {
            users: [],
            roles: [],
            countries: [],
            searchTermName: '',
            searchTermRole: '',
            searchTermCountry: '',
            isLoading: false,
            currentSort:'name',
            currentSortDir:'asc'
        }
    },
    methods: {
        async allUsers(page = 1) {
            this.statusSpinner();
            const response = await axios.get(`/api/admin/usersList?page=${page}`);
            this.users = response.data;
            this.statusSpinner();
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
        Reset() {
            this.searchTermName = '';
            this.searchTermRole = '';
            this.searchTermCountry = '';
        },
        colorRole(role) {
            switch (role) {
            case 'Admin':
                return 'option5';
            case 'Elder':
                return 'option1';
            case 'User':
                return 'option3';
            default:
                return 'option2';
        }
        },
        statusSpinner() {
            this.isLoading = !this.isLoading;
        },
        filterSearch(data) {
            return data
                    .filter(user => user.username.toLowerCase().indexOf(this.searchTermName.toLowerCase()) > -1)
                    .filter(user => user.role.toLowerCase().indexOf(this.searchTermRole.toLowerCase()) > -1)
                    .filter(user => user.country_id.toLowerCase().indexOf(this.searchTermCountry.toLowerCase()) > -1)
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
        sortedUsers:function() {
            return this.filterSearch(this.users.data).sort((a,b) => {
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

</style>