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

import dashboard from '../components/admin/dashboard.vue';
import statistics from '../components/admin/statistics/statistics.vue';
import bought from '../components/admin/statistics/bought.vue';
import sold from '../components/admin/statistics/sold.vue';
import users from '../components/admin/users/users.vue';
import createUser from '../components/admin/users/create-user.vue';
import editUser from '../components/admin/users/edit-user.vue';
import roles from '../components/admin/roles/roles.vue';
import createRole from '../components/admin/roles/add-role.vue';
import editRole from '../components/admin/roles/edit-role.vue';
import editStock from '../components/admin/stocks/edit-stock.vue';
import stocks from '../components/admin/stocks/stocks.vue';
import vendor from '../components/admin/stocks/vendor.vue';

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
            children: [
                {
                    path: '',
                    component: dashboard,
                    name: 'dashboard',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/statistics',
                    component: statistics,
                    name: 'statistics',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/bought',
                    component: bought,
                    name: 'bought',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/sold',
                    component: sold,
                    name: 'sold',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/users',
                    component: users,
                    name: 'users',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/create-user',
                    component: createUser,
                    name: 'createUser',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/edit-user/:id',
                    component: editUser,
                    name: 'editUser',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/roles',
                    component: roles,
                    name: 'roles',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/create-role',
                    component: createRole,
                    name: 'createRole',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/edit-role/:id',
                    component: editRole,
                    name: 'editRole',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/stocks',
                    component: stocks,
                    name: 'stocks',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/edit-stock/:id',
                    component: editStock,
                    name: 'editStock',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
                {
                    path: '/profile/vendor',
                    component: vendor,
                    name: 'vendor',
                    meta: { requiresAuth: true, requiresAdmin: true },
                },
            ]
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