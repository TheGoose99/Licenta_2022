import { createRouter, createWebHistory } from 'vue-router';

import landingPage from '../pages/landingPage.vue';
import loginPage from '../pages/auth/login.vue';
import signupPage from '../pages/auth/signup.vue';
import buyPage from '../pages/buy.vue';
import marketPage from '../pages/market.vue';
import settingsPage from '../pages/profileMain.vue';
import NotFoundPage from '../pages/NotFoundPage.vue';

import store from '../store/index.js';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        { path: '/', component: landingPage },
        { path: '/login', component: loginPage, meta: { requiresUnauth: true } },
        { path: '/signup', component: signupPage, meta: { requiresUnauth: true } },
        { path: '/buy', component: buyPage, meta: { requiresAuth: true, } },
        { path: '/market', component: marketPage, name: "marketPage" },
        { path: '/profile', component: settingsPage, meta: { requiresAuth: true, } },
        { path: '/:notFound(.*)', component: NotFoundPage, meta: { hideNavbar: true, } },
    ]
});

router.beforeEach(function(to, _, next) {
    if(to.meta.requiresAuth && !store.getters.isAuthenticated) {
        next('/login');
    }
    else if(to.meta.requiresUnauth && store.getters.isAuthenticated) {
        next('/market');
    } else {
        next();
    }
});

export default router;