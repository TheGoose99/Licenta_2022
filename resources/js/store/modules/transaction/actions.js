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
    },

    async sell(context, payload) {
        return context.dispatch('makeTransaction', {
            ...payload,
            mode: 'sell'
        });
    },

    async buy(context, payload) {
        return context.dispatch('makeTransaction', {
            ...payload,
            mode: 'buy'
        });
    },

    async buy_stocks(context, payload) {
        return context.dispatch('makeTransaction', {
            ...payload,
            mode: 'buy_stocks'
        });
    },

    async makeTransaction({getters}, payload) {

        const userId = getters.userId;

        let wallet= null;
        let url = '/api/purchases/store';

        switch (payload.mode) {
            case 'sell':
                url = '/api/sells/store';
                break;
            case 'buy_stocks':
                url = '/api/admin/stock';
                break;
            default:
                url = '/api/buy/store';
                break;
        }

        await axios.get('/sanctum/csrf-cookie')

        if(payload.mode == 'buy_stocks') {
            const response = await axios.post(url, payload, {
                withCredentials: true,
            })

            const responseData = await response.data;

            if(!response.statusText) {
                const error = new Error(
                    responseData.message
                );
            throw error;
            }

        } else {

            await axios.get('/api/user/loadWallet/' + userId)
            .then(({data}) => (wallet = data))

            const response = await axios.post(url, {...payload, wallet, userId}, {
                withCredentials: true,
            })

            const responseData = await response.data;

            if(!response.statusText) {
                const error = new Error(
                    responseData.message
                );
            throw error;
            }
        }

    },
}