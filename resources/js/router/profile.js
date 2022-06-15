import settingsPage from '../pages/profileMain.vue';
import editPage from '../components/settings/profileEdit.vue';
import viewPage from '../components/settings/profileView.vue';
import changeUsername from '../components/settings/changeUsername.vue';
import changePassword from '../components/settings/changePassword.vue';
import biling from '../components/settings/biling.vue';
import userPurchasesHistory from '../components/settings/userPurchasesHistory.vue';
import userSellsHistory from '../components/settings/userSellsHistory.vue';

export default [
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
            {
                path: '/profile/biling/sells',
                name: 'userSellsHistory',
                component: userSellsHistory,
                meta: { requiresAuth: true },
            },
            {
                path: '/profile/biling/purchases',
                name: 'userPurchasesHistory',
                component: userPurchasesHistory,
                meta: { requiresAuth: true },
            },
        ]
    },
]