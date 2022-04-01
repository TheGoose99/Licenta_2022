<template>
    <footer class="footer fixed-bottom dark-mode" :style="{ color: navColors[$route.path] }">
        <strong>Copyright &copy; 2022 <a href="https://github.com/TheGoose99/Licenta_2022">Licenta Potoroaca Marian</a>.</strong>
        All rights reserved.
        <div class="float-end d-none d-sm-inline-block">
            <b>Version</b> 0.4.9 Beta
        </div>
    </footer>
</template>

<script>
export default {
    data() {
        return {
            navColors: {
                '/login': 'white',
                '/register': 'white',
                '/market': 'white',
                '/about': 'white',
                '/contact': 'white',
                '/profile': 'white',
                '/': 'white',
            }
        }
    },
}
</script>

<style scoped>

</style>