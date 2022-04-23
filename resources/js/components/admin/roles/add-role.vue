<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Updating Your Profile..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <hr>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-9 border-right">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Create Role</h4>
                    </div>
                    <form method="POST" @submit.prevent="createRole">
                        <div class="row mt-2">
                            <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" v-model="form.name"></div>
                            <div class="col-md-12"><label class="labels">Slug</label><input type="text" class="form-control" v-model="form.slug"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6 text-start"><button class="btn btn-danger profile-button" @click="emitRoute('dashboard')">Back</button></div>
                            <div class="col-md-6 text-center"><button class="btn btn-primary profile-button" type="submit">Create Role</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import loadProfile from '../../mixins/settingsMixins/loadProfile.js';

export default {
    data () {
        return {
            form: {
                name: '',
                slug: '',
            },
            error: '',
            isLoading: false,
        }
    },
    mixins: [loadProfile],
    created() {
    },
    methods: {
        async createRole() {
                if(this.form.name && this.form.slug) {
                    this.isLoading = true;

                    try {
                        await axios.get('/sanctum/csrf-cookie')

                        await axios.post('/api/admin/roles', this.form, {
                            withCredentials: true,
                        })

                        this.emitRoute('roles');

                        Toast.fire({
                                icon: 'success',
                                title: 'Role added successfully'
                            })

                        this.$router.replace('/profile/roles');

                    } catch(error) {
                        console.log(error);
                        this.error = error.message || 'Could not upload data. Try again later.'
                    }
                    this.isLoading = false;
                }

        },
        handleError() {
            this.error = false;
        },
        emitRoute(payload) {
            this.$store.commit('setComponent', payload);
        },
    },
}
</script>

<style scoped>

    select,
    select > option
    {
        width: 200px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
    }
</style>