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
    retrieveselectedCrypto(state) {
        return state.selectedCrypto;
    },
    retrieveselectedCryptoAmount(state) {
        return state.selectedCryptoAmount;
    },
}