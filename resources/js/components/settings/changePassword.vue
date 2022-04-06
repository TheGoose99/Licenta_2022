<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
            <p style="color: red"> {{ error }} </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Changing password..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <div class="tab-pane" id="security">
            <h6>SECURITY SETTINGS</h6>
            <hr>
            <form @submit.prevent="changePassword" method="PUT">
                <div class="form-group">
                    <label class="d-block">Change Password</label>
                    <div class="py-1">
                        <input type="password" class="form-control" placeholder="Enter your old password" v-model="form.old_password">
                    </div>
                    <div class="py-1">
                        <input type="password" class="form-control mt-1" placeholder="New password" v-model="form.new_password">
                    </div>
                    <div class="py-1">
                        <input type="password" class="form-control mt-1" placeholder="Confirm new password" v-model="form.new_password_confirmation">
                    </div>
                </div>
                <p style="color: black">Your new password must be at least 8 characters, a number, a lowercase letter, an uppercase letter and a special characters</p>
                <div class="py-3">
                    <button class="btn btn-primary">Change Password</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
    data() {
        return {
            form: {
                old_password: '',
                new_password: '',
                new_password_confirmation: '',
            },
            error: '',
            isLoading: false,
        };
    },
    methods: {
        validatePasswordComplete(password) {
            if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/.test(password)) {
                return (true)
            }
            return (false)
        },
        async changePassword() {
            if(this.form.new_password === this.form.new_password_confirmation && this.validatePasswordComplete(this.form.new_password)) {
                this.isLoading = true;

                const payload = {
                    old_password: this.form.old_password,
                    password: this.form.new_password,
                    password_confirmation: this.form.new_password_confirmation,
                }

                try {

                    await axios.put('/api/user/changePassword/'+this.userId, payload, {
                        withCredentials: true,
                    })

                    Toast.fire({
                            icon: 'success',
                            title: 'Password successfully changed'
                        })

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;
            } else {
                this.error = "Incorrect format password!";
            }
        },
        handleError() {
            this.error = false;
        },
    },
    computed: {
        ...mapGetters({userId: 'userId'})
    },
}
</script>

<style scoped>

</style>