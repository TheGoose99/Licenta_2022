export default {

    async trendyCrypto(context, payload) {
        return context.dispatch('loadData', {
            ...payload,
            mode: 'trendyCrypto'
        });
    },

    async volumeCrypto(context, payload) {
        return context.dispatch('loadData', {
            ...payload,
            mode: 'volumeCrypto'
        });
    },

    async highestCrypto(context, payload) {
        return context.dispatch('loadData', {
            ...payload,
            mode: 'highestcrypto'
        });
    },

    async loadData(context, payload) {

        var options = {
            method: 'GET',
            url: `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=${payload.orderType}&per_page=${payload.perPage}&page=${payload.currentPage}&sparkline=false`,
            headers: {
                'X-RapidAPI-Host': 'bravenewcoin.p.rapidapi.com',
                'X-RapidAPI-Key': '486392111cmsh5a5ea9c15b8ea78p1d791fjsn944596d92d2b'
            }
        };

        const response = await axios.request(options);

        const responseData = await response.data;

        if(!response.status) {
            const error = new Error(
                responseData.message || 'Failed to load data.'
            );
        throw error;
        }

        if(payload.mode == 'trendyCrypto') {
            context.commit('setTrendyCryptoData', {
                trendyCryptos: responseData,
            });
        } else if(payload.mode == 'volumeCrypto') {
            context.commit('setVolumeCryptoData', {
                volumeCryptos: responseData,
            });
        } else if(payload.mode == 'highestcrypto') {
            context.commit('setHighestCryptoData', {
                highestCryptos: responseData,
            });
        }
    },

    cryptoAssignment(context, payload) {
        context.commit('selectedCrypto', {
            name: payload.name,
            price: payload.price,
        });
    }
};