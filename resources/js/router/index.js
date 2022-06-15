import { createRouter, createWebHistory } from 'vue-router';

import landingPage from '../pages/landingPage.vue';
import buyPage from '../pages/crypto/buy.vue';
import marketPage from '../pages/crypto/market.vue';
import aboutPage from '../pages/about.vue';
import NotFoundPage from '../pages/NotFoundPage.vue';

import store from '../store/index.js';

import externalAdmin from './admin.js';
import externalProfile from './profile.js';
import externalAuth from './auth.js';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        ...externalAdmin,
        ...externalProfile,
        ...externalAuth,
        {
            path: '/',
            component: landingPage,
        },
        {
            path: '/buy',
            component: buyPage,
            meta: { requiresAuth: true, }
        },
        {
            path: '/market',
            component: marketPage,
            name: "marketPage"
        },
        {
            path: '/about',
            component: aboutPage,
        },
        {
            path: '/:notFound(.*)',
            component: NotFoundPage,
            meta: { hideNavbar: true, }
        },
    ]
});

router.beforeEach(function(to, _, next) {
    if(to.meta.requiresAuth && store.getters.isAuthenticated && store.getters.retrieveUserRole !== 'Admin' && to.meta.requiresAdmin) {
        next('/');
    }
    else if(to.meta.requiresAuth && !store.getters.isAuthenticated) {
        next('/login');
    }
    else if(to.meta.requiresUnauth && store.getters.isAuthenticated) {
        next('/market');
    } else {
        next();
    }
});

export default router;