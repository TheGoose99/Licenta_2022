<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
            <p> {{ error }} </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Authenticating..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <BaseCard id="basecard">
            <form @submit.prevent="loginValidation" class="user" method="POST">
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
                            <label for="name"><b>Password:</b></label>
                            <input  type="password"
                                    class="form-control"
                                    v-model="form.password"
                                    >
                        </div>
                    </div>

                <li v-show="FormIsvalid === false" class="input-group justify-content-center"><p>Email Or Password Incorrect!</p></li>

                <div class="form-group">
                    <div class="d-grid gap-2">
                        <button class="btn btn-block" type="submit">Login</button>
                    </div>
                </div>
            </form>

            <div class="p-3">
                <div class="row">
                    <div class="col">
                        <div class="text-start">
                            <router-link class="font-weight-bold small routerButtons" to="/signup">Create an Account!</router-link>
                        </div>
                    </div>
                    <div class="col">
                        <div class="text-end">
                            <router-link class="font-weight-bold small routerButtons" to="/forgot">Forgot Password</router-link>
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
            isLoading: false,
        }
    },
    mixins: [validators],
    methods: {
        async loginValidation() {
            if(this.validateEmail(this.form.email) && this.validatePasswordComplete(this.form.password)) {
                this.FormIsvalid = true;
            } else {
                this.FormIsvalid = false;
            }

            this.isLoading = true;

            if(this.FormIsvalid) {

                const payload = {
                    email: this.form.email,
                    password: this.form.password,
                }

                try {

                    await this.$store.dispatch('login', payload);

                    await this.$store.dispatch('assignRole');

                    Toast.fire({
                        icon: 'success',
                        title: 'Signed in successfully'
                    })

                    const redirectURL = '/' + (this.$route.query.redirect || 'market');

                    await this.$router.replace(redirectURL);

                } catch(error) {
                    console.log(error);
                    this.error = error.message || 'Failed to authenticate. Try again later.'
                }

            } else {
                this.clearForm();
            }

            this.isLoading = false;
        },
        clearForm() {
            this.form.email = '';
            this.form.password = '';
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
        color: red;
        font-weight: bold;
    }
</style>