<template>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-sm-12 my-auto">
            <h1 class="text-center">Login</h1>
                <loginForm></loginForm>
        </div>
    </div>
</template>

<script>
import loginForm from '../../components/auth/login/loginForm.vue';

export default {
    components: {
        loginForm,
    }
}
</script>

<style scoped>

</style>