<template>
    <div>
        <input v-model="searchTerm" type="text" class="form-control" style="width: 300px;" placeholder="Search Here">
        <br>

        <div class="row">
            <div class="col-lg-12 mb-4">
                <div class="card">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Roles List</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Slug</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="role in filterSearch" :key="role.id">
                                    <td> {{ role.name }} </td>
                                    <td> {{ role.slug }} </td>
                                    <td>
                                        <router-link :to="{ path: '/admin/edit-role/'+ role.id }"><button @click="emitId(role.id)" class="btn btn-sm btn-success">Edit</button></router-link>
                                        <button @click="deleteRole(role.id)" class="btn btn-sm btn-danger">Delete</button>
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
        this.allRoles();
    },
    data() {
        return {
            roles: [],
            searchTerm: '',
        }
    },
    methods: {
        allRoles() {
            axios.get('/api/admin/roles')
            .then((response) => (this.roles = response.data))
            .catch()
        },
        deleteRole(id) {
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
                axios.delete('/api/admin/roles/'+id)
                .then(() => {
                    this.roles = this.roles.filter(role => {
                        return role.id != id;
                    });
                })

            Swal.fire(
                'Deleted!',
                'Your role has been deleted.',
                'success'
                )
            }
            })
        },
        emitId(id) {
            this.$store.commit('AssignId', id);
        }
    },
    computed: {
        filterSearch() {
            return this.roles.filter(role => {
                return role.slug.match(this.searchTerm)
            })
        },
    },
}
</script>

<style scoped>

</style>