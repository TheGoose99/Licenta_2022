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
    selectedCrypto(state, payload) {
        state.selectedCrypto = payload.name;
        state.selectedCryptoAmount = payload.price;
        state.selectedCryptoSymbol = payload.cryptoSymbol;
    },
}