<template>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-sm-11 my-auto">
            <ExchangeCrypto></ExchangeCrypto>
        </div>
    </div>
</template>

<script>
import ExchangeCrypto from '../../components/crypto/ExchangeCrypto.vue';

export default {
    components: {
        ExchangeCrypto,
    },
}
</script>

<style scoped>

</style>