export default {
    data() {
        return {
            form: {
                name: '',
                email: '',
                phone: '',
                address: '',
                postal_code: '',
                country_id: '',
            },
        }
    },
    methods: {
        async loadProfile() {
            await axios.get('/sanctum/csrf-cookie')

            let url = '/api/user/show/';

            const response = await axios.get(url + this.userId);

            this.form = await response.data;

            if(this.form.country_id) {
                axios.get('/api/countryName/' + this.form.country_id)
                    .then(({data}) => (this.form.country_id = data, this.selected = data));
            }

            if(!response.statusText) {
                const error = new Error(
                    responseData.message || 'Failed to authenticate. Check your credentials.'
                );
            throw error;
            }
        },
    }
}