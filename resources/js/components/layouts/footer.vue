<template>
    <footer class="footer fixed-bottom dark-mode" :style="{ color: navColors[$route.path] }">
        <strong>Copyright &copy; 2022 <a href="https://github.com/TheGoose99/Licenta_2022">Licenta Potoroaca Marian</a>.</strong>
        All rights reserved.
        <div class="float-end d-none d-sm-inline-block">
            <b>Version</b> 0.9.5 Open Beta
        </div>
    </footer>
</template>

<script>
export default {
    data() {
        return {
            navColors: {
                '/login': 'white',
                '/signup': 'white',
                '/forgot': 'white',
                '/market': 'white',
                '/about': 'white',
                '/admin': 'white',
                '/contact': 'white',
                '/profile': 'white',
                '/profile/edit': 'white',
                '/profile/username': 'white',
                '/profile/password': 'white',
                '/profile/biling': 'white',
                '/': 'white',
            }
        }
    },
}
</script>

<style scoped>

</style>