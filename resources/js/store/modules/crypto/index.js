import mutations from './mutations.js';
import actions from './actions.js';
import getters from './getters.js'

export default {
    state() {
        return {
            trendyCryptos: [],
            volumeCryptos: [],
            highestCryptos: [],
            selectedCrypto: '',
            selectedCryptoAmount: '',
        };
    },
    mutations,
    actions,
    getters,
}