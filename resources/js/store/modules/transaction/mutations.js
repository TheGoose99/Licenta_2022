export default {
    setTransactions(state, payload) {
        state.purchases = payload.purchases;
        state.sells = payload.sells;
    },
}