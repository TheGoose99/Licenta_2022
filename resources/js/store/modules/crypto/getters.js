export default {
    retrieveTrendyCryptoData(state) {
        return state.trendyCryptos;
    },
    retrieveVolumeCryptoData(state) {
        return state.volumeCryptos;
    },
    retrieveHighestCryptoData(state) {
        return state.highestCryptos;
    },
    retrieveSelectedCurrentPageCrypto(state) {
        return state.selectedCurrentPageCrypto;
    },
    retrieveselectedCrypto(state) {
        return state.selectedCrypto;
    },
    retrieveselectedCryptoAmount(state) {
        return state.selectedCryptoAmount;
    },
    retrieveselectedCryptoSymbol(state) {
        return state.selectedCryptoSymbol;
    },

}