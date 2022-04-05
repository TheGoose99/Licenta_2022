export default {
    data() {
        return {
            form: {
                username: '',
                email: '',
                password: '',
            },
            FormIsvalid: true,
            error: '',
        }
    },
    methods: {
        validatePasswordComplete(password) {
            if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/.test(password)) {
                return (true)
            }
            return (false)
        },
        validateEmail(email) {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                return (true)
            }
            return (false)
        },
        validateName(name) {
            if (/(?=.{1,25})/.test(name)) {
                return (true)
            }
            return (false)
        },
        validateUsername(username) {
            if(/[a-zA-Z]+/.test(username)) {
                return (true)
            }
            return (false)
        },
        handleError() {
            this.error = null;
        },
    },
};