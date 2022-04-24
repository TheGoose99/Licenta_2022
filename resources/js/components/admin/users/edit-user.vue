<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Updating Your Profile..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <h6>YOUR PROFILE INFORMATION</h6>
        <hr>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-9 border-right">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Edit Profile</h4>
                    </div>
                    <form method="PUT" @submit.prevent="updateData">
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Username</label><input type="text" class="form-control" v-model="form.username"></div>
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" v-model="form.name"></div>
                            <div class="col-md-6"><label class="labels">Phone</label><input type="number" class="form-control" v-model="form.phone"></div>
                            <div class="col-md-6"><label class="labels">Email</label><input type="email" class="form-control" v-model="form.email"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Wallet</label><input type="text" class="form-control" v-model="form.wallet"></div>
                            <div class="col-md-6"><label class="labels">Address</label><input type="text" class="form-control" v-model="form.address"></div>
                            <div class="col-md-6"><label class="labels">Postal Code</label><input type="text" class="form-control" v-model="form.postal_code"></div>
                            <div class="col-md-5"><label class="labels">Country</label>
                                <select v-model="selected" @click="changeCountry" class="form-control">
                                    <option v-for="country in countries" :key="country.id"> {{ country.country_name }} </option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Role</label>
                                <select v-model="selectedRole" @click="changeRole" class="form-control">
                                    <option v-for="role in roles" :key="role.id"> {{ role.name }} </option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6 text-start"><router-link :to="{ name: 'users' }"><button class="btn btn-danger profile-button btn-sm" @click="emitRoute('users')">Back</button></router-link></div>
                            <div class="col-md-6 text-center"><button class="btn btn-primary profile-button btn-sm" type="submit">Save Profile</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import loadProfile from '../../mixins/settingsMixins/loadProfile.js';
import validators from '../../mixins/validations/validators.js';

export default {
    data () {
        return {
            form: {
                username: '',
                wallet: '',
            },
            error: '',
            isLoading: false,
            countries: [],
            roles: [],
            selected: '',
            selectedRole: '',
        }
    },
    mixins: [loadProfile, validators],
    created() {
        this.loadProfile();
        this.loadCountries();
        this.loadRoles();
    },
    methods: {
        async updateData() {

            if(this.validateEmail(this.form.email) && this.validateName(this.form.name) && this.validateUsername(this.form.username)) {
                this.FormIsvalid = true;
            } else {
                this.FormIsvalid = false;
            }

            if(this.FormIsvalid) {
                this.isLoading = true;

                function isNumeric(num){
                    return !isNaN(num)
                }

                if(this.form.country_id) {
                    if(isNumeric(this.form.country_id)) {
                        axios.get('/api/countryName/' + this.form.country_id)
                            .then(({data}) => (this.form.country_id = data));
                    }
                }

                try {
                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/admin/user/' + this.userId, this.form, {
                        withCredentials: true,
                    })

                    if(this.selectedRole !== 'User') {
                        await axios.post('/api/admin/user/' + this.userId + '/attach/' + this.selectedRole);
                    }

                    Toast.fire({
                            icon: 'success',
                            title: 'Profile updated successfully'
                        })

                    this.$router.replace('/profile/users');

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;
            }
        },
        async loadCountries() {

            const response = await axios.get('/api/countries');

            this.countries = response.data;
        },
        changeCountry() {
            this.form.country_id = this.selected;
        },
        handleError() {
            this.error = false;
        },
        emitRoute(payload) {
            this.$store.commit('setComponent', payload);
        },
        async loadRoles() {
            const response = await axios.get('/api/admin/roles');
            const response2 = await axios.get('/api/user/getRole/' + this.userId);

            if(response2.data.length == 0) {
                this.selectedRole = 'User';
            } else {
                this.selectedRole = response2.data[0].name;
            }
            this.roles = response.data;
        }
    },
    computed:{
        ...mapGetters({userId: 'getSelectedId'}),
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