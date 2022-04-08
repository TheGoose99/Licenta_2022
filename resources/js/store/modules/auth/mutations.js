import axios from "axios";

export default {
    setUser(state, payload) {
        state.token = payload.token;
        state.userId = payload.user_id;
        state.userName = payload.user_name;
        state.didAutoLogout = false;
    },
    setAutoLogout(state) {
        state.didAutoLogout = true;
    },
    setToken(state, payload) {
        state.token = payload.token;
    },
    setUsername(state, payload) {
        state.userName = payload.username;
    },
    setRole(state, payload) {
        state.userRole = payload.name;
    },
    removeRole(state) {
        state.userRole = null;
    },
    loginVerify(state) {
        const storeToken = localStorage.getItem('token');
        const storeUser = localStorage.getItem('userId');
        const storeUserName = localStorage.getItem('userName');

        if(storeToken) {
            state.token = storeToken;
            state.userId = storeUser;
            state.userName = storeUserName;
            state.didAutoLogout = false;
        } else {
            return;
        }
    },
};