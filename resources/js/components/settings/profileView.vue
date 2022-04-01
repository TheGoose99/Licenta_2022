<template>
    <h6>YOUR PROFILE INFORMATION</h6>
    <hr>
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-6" id="em_photo" :src="form.avatar">
                    <p class="font-weight-bold">{{ form.username }}</p>
                    <p class="text-black-50">{{ form.email }}</p><span> </span>
                </div>
            </div>
            <div class="col-md-9 border-right">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label class="labels">Name</label>
                        <p v-if="form.name" type="text">{{ form.name }}</p>
                        <p v-else>No Name Found</p>
                    </div>
                    <div class="col-md-6">
                        <label class="labels">Phone</label>
                        <p v-if="form.phone" type="text">{{ form.phone }}</p>
                        <p v-else>No Phone Number Found</p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label class="labels">Email</label>
                        <p v-if="form.email" type="text">{{ form.email }}</p>
                        <p v-else>No Email Found</p>
                    </div>
                    <div class="col-md-6">
                        <label class="labels">Address</label>
                        <p v-if="form.address" type="text">{{ form.address }}</p>
                        <p v-else>No Address Found</p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label class="labels">Postal Code</label>
                        <p v-if="form.postal_code" type="text">{{ form.postal_code }}</p>
                        <p v-else>No Postal Code Found</p>
                    </div>
                    <div class="col-md-6">
                        <label class="labels">Country</label>
                        <p v-if="form.country_id" type="text">{{ form.country_id }}</p>
                        <p v-else>No Country Found</p>
                    </div>
                </div>
                <div class="mt-3 text-center"><button class="btn btn-primary profile-button" @click="emitRoute('profileEdit')">Edit Profile</button></div>
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
                phone: '',
                address: '',
                postal_code: '',
                country_id: '',
            },
        }
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
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
        emitRoute(payload) {
            this.$store.commit('setComponent', payload)
        },
    },
    computed: {
        ...mapGetters({
            userId: 'userId',
            switchComponent: 'retrieveComponent',
            }),
    },
}
</script>

<style scoped>
    #em_photo {
        width: 160px;
        height: 160px;
    }
</style>