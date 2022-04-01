<template>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-sm-11 my-auto">
            <coinTracker></coinTracker>
        </div>
    </div>
</template>

<script>
import coinTracker from '../components/crypto/Trackercoin.vue';

export default {
    components: {
        coinTracker,
    },
}
</script>

<style scoped>

</style>