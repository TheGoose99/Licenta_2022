<template>
    <section>
        <base-card>
            <h2>Page not found</h2>
            <p>This page could not be found - maybe check out all our <router-link to="/market">cryptos</router-link>.</p>
        </base-card>
    </section>
</template>

<script>
export default {
    created: function () {
        document.body.style.backgroundColor = "#ffffff";
    },
    unmounted: function () {
        document.body.style.backgroundColor = "#181a20";
    },
}
</script>

<style scoped>

</style>