import { mapGetters } from 'vuex'

export default {
    data() {
        return {
            searchTerm: '',
            error: '',
        }
    },
    methods: {
        capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        },
        PercentageColor(data) {
            if(data > 0) {
                return true;
            }
            return false;
        },
        handleError() {
            this.error = !this.error;
        },
    },
    computed: {
        filterSearch() {
            return this.retrieveHighestCryptoData.filter(crypto => {
                return crypto.name.match(this.capitalizeFirstLetter(this.searchTerm));
            })
        },
        ...mapGetters([
            'retrieveHighestCryptoData',
        ]),
    },
}