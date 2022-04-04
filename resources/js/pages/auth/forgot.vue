<template>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-sm-12 my-auto">

            <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p class="text-danger"> {{ error }} </p>
            </base-dialog>

            <base-dialog :show="isLoading" title="Authenticating..." fixed>
                <base-spinner></base-spinner>
            </base-dialog>

            <h1 class="text-center">Forgot Password</h1>

            <BaseCard id="basecard">
                <form @submit.prevent="forgotValidation" class="user" method="PUT">
                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="name"><b>Email:</b></label>
                            <input  type="email"
                                    class="form-control"
                                    v-model="form.email"
                                    >
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="name"><b>Username:</b></label>
                            <input  type="text"
                                    class="form-control"
                                    v-model="form.username"
                                    >
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="password"><b>New Password:</b></label>
                            <input  type="password"
                                    class="form-control"
                                    v-model="form.password"
                                    >
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="new_password"><b>Confirm New Password:</b></label>
                            <input  type="password"
                                    class="form-control"
                                    v-model="form.new_password"
                                    >
                        </div>
                    </div>

                    <li class="input-group justify-content-center"><p>Introduce your credentials & insert a password containing 8 characters, at least an uppercase, lowercase, number and special character.</p></li>
                    <li v-show="FormIsvalid === false" class="input-group justify-content-center"><p class="text-danger">Email Or Username Incorrect!</p></li>

                    <div class="form-group">
                        <div class="d-grid gap-2">
                            <button class="btn btn-block" type="submit">Change Password</button>
                        </div>
                    </div>
                </form>

                <div class="p-3">
                    <div class="row">
                        <div class="col">
                            <div class="text-start">
                                <router-link class="font-weight-bold small routerButtons" to="/login">Back to login</router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </BaseCard>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            form: {
                email: '',
                username: '',
                password: '',
                new_password: '',
            },
            FormIsvalid: true,
            isLoading: false,
            error: '',
        }
    },
    methods: {
        handleError() {
            this.error = !this.error;
        },
        validateForgot(email, username, password, newPassword) {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) && /[a-zA-Z]+/.test(username) && /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/.test(password) && password === newPassword) {
                return (true)
            }
            return (false)
        },
        async forgotValidation() {
            if(this.validateForgot(this.form.email, this.form.username, this.form.password, this.form.new_password)) {
                this.FormIsvalid = true;
            } else {
                this.FormIsvalid = false;
            }

            this.isLoading = true;

            if(this.FormIsvalid) {

                const payload = {
                    email: this.form.email,
                    username: this.form.username,
                    password: this.form.password,
                    password_confirmation: this.form.new_password,
                }

                try {

                    await axios.post('/api/user/forgotPassword', payload, {
                        withCredentials: true,
                    });

                    Toast.fire({
                        icon: 'success',
                        title: 'Password changed successfully'
                    })

                    await this.$router.replace('/login');

                } catch (error) {
                    console.log(error);
                    this.error = error.message || 'Failed to change password. Try again later.'
                }
            } else {
                this.error = "Incorrect Password Format Or Input Credentials!"
            }

            this.isLoading = false;
        },
    },
}
</script>

<style scoped>
    .routerButtons {
        font-size: 16px;
        text-decoration: none;
    }

    .text-danger {
        font-size: 14px;
    }

    form input {
        border: 1px solid black;
    }

    button {
        color: white;
        background-color: #F7931A;
        font-weight: bold;
        border: 1px solid black;
    }

    button:hover {
        color: #ffffff ;
        background-color: #f58a09;
    }

    #basecard {
        background-color: white;
    }

    li {
        list-style-type: none;
    }

    .fa-exclamation-triangle {
        color: red;
        font-size: 18px;
    }

    p {
        font-weight: bold;
    }
</style>