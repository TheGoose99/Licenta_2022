// Timer global in file:
let timer;

export default {

    async login(context, payload) {
        return context.dispatch('auth', {
            ...payload,
            mode: 'login'
        });
    },

    async signup(context, payload) {
        return context.dispatch('auth', {
            ...payload,
            mode: 'signup'
        });
    },

    async auth(context, credentials) {

        await axios.get('/sanctum/csrf-cookie')

        let url = '/api/login';

        if (credentials.mode === 'signup') {
            url = '/api/register';
        }

        const response = await axios.post(url, credentials, {
            withCredentials: true,
        });

        const responseData = await response.data;

        if(!response.statusText) {
            const error = new Error(
                responseData.message || 'Failed to authenticate. Check your credentials.'
            );
        throw error;
        }

        // Daca adaugi '+' la incept, o sa il converteasca in numar:
        const expiresIn = +responseData.expires_in * 1000;
        const expirationDate = new Date().getTime() + expiresIn;

        localStorage.setItem('token', responseData.access_token);
        localStorage.setItem('tokenExpiration', expirationDate);
        localStorage.setItem('userId', responseData.user_id);
        localStorage.setItem('userName', responseData.username);

        timer = setTimeout(function() {
            context.dispatch('autoLogout');
        }, expiresIn)

        context.commit('setUser', {
            token: responseData.access_token,
            user_id: responseData.user_id,
            user_name: responseData.username,
        });

    },
    tryLogin(context) {
        const token = localStorage.getItem('token');
        const userId = localStorage.getItem('userId');
        const tokenExpiration = localStorage.getItem('tokenExpiration');

        const expiresIn = +tokenExpiration - new Date().getTime();

        if(expiresIn < 0) {
            return;
        }

        timer = setTimeout(function() {
            context.dispatch('autoLogout');
        }, expiresIn)

        if (token && userId) {
            context.commit('setUser', {
                token: token,
                userId: userId,
            });
        }
    },
    logout(context) {
        localStorage.removeItem('token');
        localStorage.removeItem('tokenExpiration');
        localStorage.removeItem('userId');
        localStorage.removeItem('userName');

        clearTimeout(timer);

        context.commit('setUser', {
            token: null,
            userId: null,
        });
    },
    autoLogout(context) {
        context.dispatch('logout');
        context.commit('setAutoLogout');
    },
};