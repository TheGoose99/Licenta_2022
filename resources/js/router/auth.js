import loginPage from '../pages/auth/login.vue';
import signupPage from '../pages/auth/signup.vue';
import forgotPage from '../pages/auth/forgot.vue';

export default [
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
]