<template>
    <div>
        <input v-model="searchTerm" type="text" class="form-control" style="width: 300px;" placeholder="Search Here">
        <br>

        <div class="row">
            <div class="col-lg-12 mb-4">
            <!-- Simple Tables -->
                <div class="card">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Users List</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
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
                                        <button @click="toEdit('edit-user', user.id)" class="btn btn-sm btn-success">Edit</button>
                                        <button @click="deleteUser(user.id)" class="btn btn-sm btn-danger">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        this.allUsers();
    },
    data() {
        return {
            users: [],
            searchTerm: '',
        }
    },
    methods: {
        allUsers() {
            axios.get('/api/user')
            .then((response) => {
                this.users = response.data
                    this.users.forEach(function(user) {
                        if(user.country_id) {
                            axios.get('/api/countryName/' + user.country_id)
                                .then(({data}) => (user.country_id = data));
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
                axios.delete('/api/user/'+id)
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
        toEdit(payload, id) {
            this.$store.commit('setComponent', payload)

            this.$store.commit('AssignIdAdmin', id)
        },
    },
    computed: {
        filterSearch() {
            return this.users.filter(user => {
                return user.username.match(this.searchTerm)
            })
        },
    },
}
</script>

<style scoped>

</style>