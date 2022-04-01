export default {
    async loadTransactions(context, payload) {

        const reqOne = await axios.get('/api/purchases/user/' + payload.userId)

        const reqTwo = await axios.get('/api/sells/user/' + payload.userId)

        await axios.all([reqOne, reqTwo]).then(axios.spread(( ...responses ) => {
            const responseOne = responses[0].data
            const responseTwo = responses[1].data
            context.commit('setTransactions', { purchases: responseOne, sells: responseTwo });
        })).catch(errors => {
            console.log(errors);
        })
    }
}