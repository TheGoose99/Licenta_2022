<template>
    <h6>YOUR PROFILE INFORMATION</h6>
    <hr>
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <p v-if="form.username" class="font-weight-bold">{{ form.username }}</p>
                    <p v-else>No Username Found</p>
                    <p v-if="form.email" class="text-black-50">{{ form.email }}</p>
                    <p v-else>No Username Found</p><span> </span>
                </div>
            </div>
            <div class="col-md-9 border-right">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Data</h4>
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
                <div class="mt-3 text-center"><router-link to="/profile/edit"><button class="btn btn-primary profile-button" >Edit Profile</button></router-link></div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import loadProfile from '../mixins/settingsMixins/loadProfile.js';

export default {
    mixins: [loadProfile],
    created() {
        this.loadProfile();
    },
    computed: {
        ...mapGetters({
            userId: 'userId',
            }),
    },
}
</script>

<style scoped>

</style>