<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
            <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Registering..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <BaseCard id="basecard">
            <form  class="user" method="POST" @submit.prevent="registerValidation">
                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="username"><b>Username:</b></label>
                            <input  type="username"
                                    class="form-control"
                                    :class="[validateName(this.form.username) ? 'is-valid' : 'is-invalid']"
                                    placeholder="Enter your Username"
                                    v-model="form.username"
                                    >
                        </div>
                        <ul v-show="this.FormIsvalid === false">
                            <li v-show="!validateName(this.form.username)"><i class="fa fa-exclamation-triangle"></i>  You can't leave the username field empty!</li>
                        </ul>
                    </div>
                    <div class="mb-3 row">
                        <div class="form-group">
                            <label for="email"><b>Email Address:</b></label>
                            <input  type="email"
                                    class="form-control"
                                    :class="[validateEmail(this.form.email) ? 'is-valid' : 'is-invalid']"
                                    placeholder="exemple@exemple.com"
                                    v-model="form.email"
                                    >
                        </div>
                        <ul v-show="this.FormIsvalid === false">
                            <div v-show="!validateEmail(this.form.email)">
                                <li><i class="fa fa-exclamation-triangle"></i>  Must be a valid email address!</li>
                            </div>
                        </ul>
                    </div>

                        <div class="form-group">
                            <label for="email" class="col"><b>Password:</b></label>
                            <div class="input-group mb-3">
                                <input  :type="[showPassword ? 'text' : 'password']"
                                        class="form-control"
                                        :class="[validatePasswordComplete(this.form.password) ? 'is-valid' : 'is-invalid']"
                                        placeholder="Enter A Valid Password"
                                        v-model="form.password"
                                        >
                                <div class="input-group-text" style="background-color: transparent" v-show="form.password.length > 3">
                                    <span v-if="form.password.length > 0 &&
                                                form.password.length < 8">😔</span>
                                    <span v-if="form.password.length >= 8 &&
                                                form.password.length < 10">😌</span>
                                    <span v-if="form.password.length >= 10 &&
                                                form.password.length < 12">😃</span>
                                    <span v-if="form.password.length >= 12">😍</span>
                                </div>
                                <span class="input-group-text" @click="showPassword = !showPassword" style="background-color: transparent">
                                        <i class="fa" :class="[showPassword ? 'fa-eye' : 'fa-eye-slash']" aria-hidden="true"></i>
                                </span>
                            </div>
                        </div>
                        <ul v-show="!this.FormIsvalid">
                            <p v-show="!validatePasswordComplete(this.form.password)"><b>Password must contain:</b></p>
                            <li v-show="!validatePasswordLength(this.form.password)"><i class="fa fa-exclamation-triangle"></i>  At least 8 characters long and no more than 25</li>
                            <li v-show="!validatePasswordLower(this.form.password)"><i class="fa fa-exclamation-triangle"></i>  At least one lowercase letter (a-z)</li>
                            <li v-show="!validatePasswordUpper(this.form.password)"><i class="fa fa-exclamation-triangle"></i>  At least one uppercase letter (A-Z)</li>
                            <li v-show="!validatePasswordNumber(this.form.password)"><i class="fa fa-exclamation-triangle"></i>  At least one number letter (0-9)</li>
                            <li v-show="!validatePasswordSpecial(this.form.password)"><i class="fa fa-exclamation-triangle"></i>  At least one special character</li>
                        </ul>

                <div class="form-group">
                    <div class="d-grid gap-2">
                        <button class="btn btn-block" type="submit">Sign Up</button>
                    </div>
                </div>
            </form>

            <div class="form-group">
                <div class="p-3">
                    <div class="col">
                        <div class="text-start">
                            <router-link class="font-weight-bold small routerButtons" to="/login"> Have an account? </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </BaseCard>
    </div>
</template>

<script>
import validators from '../../mixins/validations/validators.js';

export default {
    data() {
        return {
            showPassword: false,
            isLoading: false,
        }
    },
    mixins: [validators],
    computed: {
        buttonLabel() {
            return (this.showPassword) ? "Hide" : "Show";
        },
    },
    methods: {
        validatePasswordLength(password) {
            if (/(?=.{8,25})/.test(password)) {
                return (true)
            }
            return (false)
        },
        validatePasswordLower(password) {
            if (/(?=.*[a-z])/.test(password)) {
                return (true)
            }
            return (false)
        },
        validatePasswordUpper(password) {
            if (/(?=.*[A-Z])/.test(password)) {
                return (true)
            }
            return (false)
        },
        validatePasswordNumber(password) {
            if (/(?=.*[1-9])/.test(password)) {
                return (true)
            }
            return (false)
        },
        validatePasswordSpecial(password) {
            if (/(?=.*[!@#$%^&*])/.test(password)) {
                return (true)
            }
            return (false)
        },
        async registerValidation() {

            if(this.validatePasswordComplete(this.form.password) && this.validateEmail(this.form.email) && this.validateName(this.form.username)) {
                this.FormIsvalid = true;
            } else {
                this.FormIsvalid = false;
            }

            if(this.FormIsvalid) {

                this.isLoading = true;

                const payload = {
                    username: this.form.username,
                    email: this.form.email,
                    password: this.form.password
                }

                try {

                    await this.$store.dispatch('signup', payload);

                    Toast.fire({
                        icon: 'success',
                        title: 'Signed up successfully'
                    })

                    const redirectURL = '/' + ('login');

                    await this.$router.replace(redirectURL);

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Failed to register. Try again later.'
                }
            }

            this.isLoading = false;
        },
        toggleShow() {
            this.showPassword = !this.showPassword;
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

    ul li {
        font-size: 18px;
        color: gray;
        list-style-type: none;
    }

    .fa-check {
        color: #1c946c;
        font-size: 18px;
    }

    .fa-exclamation-triangle {
        color: red;
        font-size: 18px;
    }

    .input-group-text {
        border: 1px solid black;
    }

</style>