<template>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-sm-12 my-auto">
            <h1 class="text-center">Sign up</h1>
            <signupForm></signupForm>
        </div>
    </div>

</template>

<script>
import signupForm from '../../components/auth/register/registerForm.vue';
export default {
    components: {
        signupForm,
    },
    beforeCreate () {
        document.querySelector('nav').setAttribute('style', 'background-color: transparent')
    },
}
</script>

<style scoped>

</style>