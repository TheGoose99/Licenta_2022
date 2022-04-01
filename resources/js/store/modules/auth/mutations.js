export default {
    setUser(state, payload) {
        state.token = payload.token;
        state.userId = payload.user_id;
        state.didAutoLogout = false;
    },
    setAutoLogout(state) {
        state.didAutoLogout = true;
    },
    setToken(state, payload) {
        state.token = payload.token;
    },
    loginVerify(state) {
        const storeToken = localStorage.getItem('token');
        const storeUser = localStorage.getItem('userId');

        if(storeToken) {
            state.token = storeToken;
            state.userId = storeUser;
            state.didAutoLogout = false;
        } else {
            return;
        }
    },
};