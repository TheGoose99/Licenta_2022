import { createRouter, createWebHistory } from 'vue-router';

import landingPage from '../pages/landingPage.vue';
import loginPage from '../pages/auth/login.vue';
import signupPage from '../pages/auth/signup.vue';
import forgotPage from '../pages/auth/forgot.vue';
import buyPage from '../pages/crypto/buy.vue';
import marketPage from '../pages/crypto/market.vue';
import aboutPage from '../pages/about.vue';
import adminPage from '../pages/admin/mainAdmin.vue';
import settingsPage from '../pages/profileMain.vue';
import NotFoundPage from '../pages/NotFoundPage.vue';
import editPage from '../components/settings/profileEdit.vue';
import viewPage from '../components/settings/profileView.vue';
import changeUsername from '../components/settings/changeUsername.vue';
import changePassword from '../components/settings/changePassword.vue';
import biling from '../components/settings/biling.vue';

import store from '../store/index.js';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: landingPage,
        },
        {
            path: '/login',
            component: loginPage,
            meta: { requiresUnauth: true }
        },
        {
            path: '/forgot',
            component: forgotPage,
            meta: { requiresUnauth: true }
        },
        {
            path: '/signup',
            component: signupPage,
            meta: { requiresUnauth: true }
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
            path: '/admin',
            component: adminPage,
            meta: { requiresAuth: true, requiresAdmin: true },
        },
        {
            path: '/profile',
            component: settingsPage,
            meta: { requiresAuth: true, },
            children: [
                {
                    path: '',
                    name: 'viewPage',
                    component: viewPage,
                    meta: { requiresAuth: true },
                },
                {
                    path: '/profile/edit',
                    name: 'editPage',
                    component: editPage,
                    meta: { requiresAuth: true },
                },
                {
                    path: '/profile/username',
                    name: 'changeUsername',
                    component: changeUsername,
                    meta: { requiresAuth: true },
                },
                {
                    path: '/profile/password',
                    name: 'changePassword',
                    component: changePassword,
                    meta: { requiresAuth: true },
                },
                {
                    path: '/profile/biling',
                    name: 'biling',
                    component: biling,
                    meta: { requiresAuth: true },
                },
            ]
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