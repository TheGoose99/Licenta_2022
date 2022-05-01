export default {
    setTrendyCryptoData(state, payload) {
        state.trendyCryptos = payload.trendyCryptos;
    },
    setVolumeCryptoData(state, payload) {
        state.volumeCryptos = payload.volumeCryptos;
    },
    setHighestCryptoData(state, payload) {
        state.highestCryptos = payload.highestCryptos;
    },
    setCurrentPageCryptoData(state, payload) {
        state.selectedCurrentPageCrypto = payload.currentPageCrypto;
    },
    selectedCrypto(state, payload) {
        state.selectedCrypto = payload.name;
        state.selectedCryptoAmount = payload.price;
        state.selectedCryptoSymbol = payload.cryptoSymbol;
    },
    setCryptoAdmin(state, payload) {
        state.selectedCrypto = payload.name;
        state.selectedCryptoSymbol = payload.symbol;
    },
}