import adminPage from '../pages/admin/mainAdmin.vue';
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

export default [
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
                path: '/admin/statistics',
                component: statistics,
                name: 'statistics',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/bought',
                component: bought,
                name: 'bought',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/sold',
                component: sold,
                name: 'sold',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/users',
                component: users,
                name: 'users',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/create-user',
                component: createUser,
                name: 'createUser',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/edit-user/:id',
                component: editUser,
                name: 'editUser',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/roles',
                component: roles,
                name: 'roles',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/create-role',
                component: createRole,
                name: 'createRole',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/edit-role/:id',
                component: editRole,
                name: 'editRole',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/stocks',
                component: stocks,
                name: 'stocks',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/edit-stock/:id',
                component: editStock,
                name: 'editStock',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
            {
                path: '/admin/vendor',
                component: vendor,
                name: 'vendor',
                meta: { requiresAuth: true, requiresAdmin: true },
            },
        ]
    },
]