<template>
    <navBar v-if="!$route.meta.hideNavbar"></navBar>
    <router-view v-slot="slotProps">
        <transition name="route" mode="out-in">
            <component :is="slotProps.Component"></component>
        </transition>
    </router-view>
    <footerBar></footerBar>
</template>

<script>

// In navbar we have an 'IF' statement to hide the navbar if the meta='hidenavbar'.
// It is used for the 404 Not Found file in order to hide the navbar.

// In order to use the routes inside the router, we have to use a router-view.
// It is like a frame that switches its content based on the current accessed page

// The transition is the animation we see while switching the current page in the router.
// The component is what we will be seeing animated by the transition.

//  As we will be seeing these two components throught most of the application, we will import them here.
//  The reason I did not import them globally is that we only need to use them in the app.vue file
// and then we can have them be visibile throughout the app:
import NavBar from './components/layouts/header/mainNavBar.vue';
import footerBar from './components/layouts/footer.vue';

export default {
    name: 'App',
    components: {
        NavBar,
        footerBar,
    },
}
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");

body {
    font-family: 'Nunito', sans-serif;
    background-color: #181a20;
    margin: 0;
}

* {
    box-sizing: border-box;
}

html {
    font-family: "Roboto", sans-serif;
}

h1 {
    color: white;
}

.route-enter-from {
    opacity: 0;
    transform: translateY(-30px);
}

.route-leave-to {
    opacity: 0;
    transform: translateY(30px);
}

.route-enter-active {
    transition: all 0.3s ease-out;
}

.route-leave-active {
    transition: all 0.3s ease-in;
}

.route-enter-to,
.route-leave-from {
    opacity: 1;
    transform: translateY(0);
}
</style>