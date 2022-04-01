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
                        <img class="rounded-circle mt-6" id="em_photo" :src="profile_pic">
                        <span class="font-weight-bold">{{ form.username }}</span>
                        <span class="text-black-50">{{ form.email }}</span><span> </span>
                    </div>
                </div>
                <div class="col-md-9 border-right">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <form method="PUT" @submit.prevent="updateData">
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
                                <div class="py-3">
                                    <input type="file" class="col-md-auto" @change="onFileSelected">
                                </div>
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

export default {
    data () {
        return {
            form: {
                name: '',
                email: '',
                avatar: '',
                new_avatar: '',
                phone: '',
                address: '',
                postal_code: '',
                country_id: '',
            },
            selected: '',
            error: '',
            profile_pic: null,
            isLoading: false,
            countries: [],
        }
    },
    methods: {
        async updateData() {

            this.isLoading = true;

            const payload = {
                name: this.form.name,
                email: this.form.email,
                phone: this.form.phone,
                address: this.form.address,
                postal_code: this.form.postal_code,
                country_id: this.form.country_id,
                avatar: this.form.avatar,
                new_avatar: this.profile_pic,
            }

            try {
                await axios.get('/sanctum/csrf-cookie')

                await axios.put('/api/user/'+this.userId, payload, {
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
        async loadProfile() {

            await axios.get('/sanctum/csrf-cookie')

            let url = '/api/user/';

            const response = await axios.get(url + this.userId);

            this.form = await response.data;

            if(this.form.country_id) {
                axios.get('/api/countryName/' + this.form.country_id)
                    .then(({data}) => (this.form.country_id = data, this.selected = data));
            }

            if(this.form.avatar) {
                this.profile_pic = this.form.avatar
            }

            if(!response.statusText) {
                const error = new Error(
                    responseData.message || 'Failed to authenticate. Check your credentials.'
                );
            throw error;
            }

        },
        async loadCountries() {

            await axios.get('/sanctum/csrf-cookie');

            const response = await axios.get('/api/countries');

            this.countries = response.data;
        },
        handleError() {
            this.error = false;
        },
        changeCountry() {
            this.form.country_id = this.selected;
        },
        onFileSelected(event) {
            let file = event.target.files[0];
            if(file.size > 1048770) {
                Toast.fire({
                icon: 'error',
                title: 'File size too big'
                })
            } else {
                let reader = new FileReader();
                reader.onload = event =>{
                    this.form.new_avatar = event.target.result
                };
                reader.readAsDataURL(file);
                this.profile_pic = URL.createObjectURL(file);
            }
        },
    },
    computed:{
        ...mapGetters({userId: 'userId'})
    },
    created() {
        this.loadProfile();
        this.loadCountries();
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