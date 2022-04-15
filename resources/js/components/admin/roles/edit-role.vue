<template>
    <div id="profile">
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
                        <h4 class="text-right">Edit Role</h4>
                    </div>
                    <form method="PUT" @submit.prevent="updateData">
                        <div class="row mt-2">
                            <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" v-model="form.name"></div>
                            <div class="col-md-12"><label class="labels">Slug</label><input type="text" class="form-control" v-model="form.slug"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6 text-start"><button class="btn btn-danger profile-button" @click="emitRoute('roles')">Back</button></div>
                            <div class="col-md-6 text-center"><button class="btn btn-primary profile-button" type="submit">Save Role</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

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
    created() {
        this.loadRoles();
    },
    methods: {
        async updateData() {

                this.isLoading = true;

                try {
                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/roles/'+this.userId, this.form, {
                        withCredentials: true,
                    })

                    this.emitRoute('roles');

                    Toast.fire({
                            icon: 'success',
                            title: 'Role updated successfully'
                        })

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;
        },
        handleError() {
            this.error = false;
        },
        emitRoute(payload) {
            this.$store.commit('setComponent', payload);
        },
        async loadRoles() {
            await axios.get('/sanctum/csrf-cookie')

            let url = '/api/roles/';

            const response = await axios.get(url + this.userId);

            this.form = await response.data;

            if(!response.statusText) {
                const error = new Error(
                    responseData.message || 'Failed to authenticate. Check your credentials.'
                );
            throw error;
            }
        },
    },
    computed:{
        ...mapGetters({userId: 'getSelectedId'}),
    },
}
</script>

<style scoped>
    #profile {
        padding-top: 160px;
    }

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