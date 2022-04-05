<template>
    <div id="profile">
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
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <span class="font-weight-bold">{{ form.username }}</span>
                        <span class="text-black-50">{{ form.email }}</span><span> </span>
                    </div>
                </div>
                <div class="col-md-9 border-right">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Edit Profile</h4>
                    </div>
                    <form method="PUT" @submit.prevent="updateData" enctype="multipart/form-data">
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" v-model="form.name"></div>
                            <div class="col-md-6"><label class="labels">Phone</label><input type="number" class="form-control" v-model="form.phone"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12"><label class="labels">Email</label><input type="email" class="form-control" v-model="form.email"></div>
                            <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" v-model="form.address"></div>
                            <div class="col-md-6"><label class="labels">Postal Code</label><input type="text" class="form-control" v-model="form.postal_code"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-5"><label class="labels">Country</label>
                                <select v-model="selected" @click="changeCountry">
                                    <option v-for="country in countries" :key="country.id" >{{ country.country_name }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="mt-4 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import loadProfile from '../mixins/settingsMixins/loadProfile.js';

export default {
    data () {
        return {
            error: '',
            isLoading: false,
            countries: [],
            selected: '',
        }
    },
    mixins: [loadProfile],
    created() {
        this.loadProfile();
        this.loadCountries();
    },
    methods: {
        async updateData() {

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
                await axios.put('/api/user/'+this.userId, this.form, {
                    'Content-Type': 'multipart/form-data',
                    withCredentials: true,
                })

                Toast.fire({
                        icon: 'success',
                        title: 'Profile updated successfully'
                    })

            } catch(error) {
                console.log(error);
                this.error = error.message || 'Could not upload data. Try again later.'
            }
            this.isLoading = false;
        },
        async loadCountries() {

            await axios.get('/sanctum/csrf-cookie');

            const response = await axios.get('/api/countries');

            this.countries = response.data;
        },
        changeCountry() {
            this.form.country_id = this.selected;
        },
        handleError() {
            this.error = false;
        },
    },
    computed:{
        ...mapGetters({userId: 'userId'})
    },
}
</script>

<style scoped>
    #em_photo {
        height: 240px;
        width: 200px;
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