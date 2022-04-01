import { createStore } from 'vuex';

import authModule from './modules/auth/index.js';
import cryptoModule from './modules/crypto/index.js';
import profileModule from './modules/profile/index.js';
import transactionModule from './modules/transaction/index.js';

const store = createStore({
    modules: {
        auth: authModule,
        crypto: cryptoModule,
        profile: profileModule,
        transaction: transactionModule,
    },
});

export default store;