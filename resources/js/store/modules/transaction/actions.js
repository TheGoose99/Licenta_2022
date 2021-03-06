export default {

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
        let url = null;

        switch (payload.mode) {
            case 'sell':
                url = '/api/sells/store';
                break;
            case 'buy_stocks':
                url = '/api/admin/stock';
                break;
            default:
                url = '/api/purchases/store';
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

            if(payload.mode == 'buy') {
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
            } else {

                const cryptoName = getters.retrieveselectedCrypto;

                const response = await axios.post(url, {...payload, wallet, userId, cryptoName}, {
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
        }

    },
}