<template>
    <div>
        <div class="card">
            <div class="form-group">
                <h1 class="text-center" style="margin-top: 100px;">Crypto Market Prices</h1>
                <div class="p-3">
                    <div class="text-start">
                        <input v-model="searchTerm" type="search" class="search" placeholder="Search Here...">
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="form-group">
                <div class="row">
                    <div class="col" style="margin-left: 10px;">
                        <base-card>
                            <h4 class="text-center">Biggest Market Share</h4>
                            <table class="table-dark">
                                <thead>
                                    <tr>
                                        <th scoped="col"></th>
                                        <th scoped="col"></th>
                                        <th scoped="col">Rank</th>
                                        <th scoped="col">24h Market Cap Change</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="marketShare in retrieveSelectedCurrentPageCrypto.slice(0, 5)" :key="marketShare.id">
                                        <th scope="row"><img :src="marketShare.image" alt="Crypto" id="em_photo"></th>
                                        <th scope="row">{{ marketShare.symbol }}</th>
                                        <th scope="row">{{ marketShare.market_cap_rank }}</th>
                                        <td scope="row" :class="[PercentageColor(marketShare.market_cap_change_24h) ? 'text-success' : 'text-danger']">{{ marketShare.market_cap_change_24h.toFixed(0) }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </base-card>
                    </div>
                    <div class="col">
                        <base-card>
                            <h4 class="text-center">Trendy Coins</h4>
                            <table class="table-dark">
                                <thead>
                                    <tr>
                                        <th scoped="col"></th>
                                        <th scoped="col"></th>
                                        <th scoped="col">Price Change 24h</th>
                                        <th scoped="col">Price Change % 24h</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="trendyCrypto in retrieveTrendyCryptoData" :key="trendyCrypto.id">
                                        <th scope="row"><img :src="trendyCrypto.image" alt="Crypto" id="em_photo"></th>
                                        <th scope="row">{{ trendyCrypto.symbol }}</th>
                                        <td scope="row" :class="[PercentageColor(trendyCrypto.price_change_24h) ? 'text-success' : 'text-danger']">{{ trendyCrypto.price_change_24h.toFixed(3) }}</td>
                                        <td scope="row" :class="[PercentageColor(trendyCrypto.price_change_percentage_24h) ? 'text-success' : 'text-danger']">{{ trendyCrypto.price_change_percentage_24h.toFixed(3) }}%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </base-card>
                    </div>
                    <div class="col" style="margin-right: 10px;">
                        <base-card>
                            <h4 class="text-center">Highest Volume Coins</h4>
                            <table class="table-dark">
                                <thead>
                                    <tr>
                                        <th scoped="col"></th>
                                        <th scoped="col"></th>
                                        <th scoped="col">Total Volume</th>
                                        <th scoped="col">Market Cap</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="highestVolume in retrieveVolumeCryptoData" :key="highestVolume.id">
                                        <th scope="row"><img :src="highestVolume.image" alt="Crypto" id="em_photo"></th>
                                        <th scope="row">{{ highestVolume.symbol }}</th>
                                        <td scope="row">{{ highestVolume.total_volume }}</td>
                                        <td scope="row">{{ highestVolume.market_cap }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </base-card>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-dark" v-if="filterSearch.length">
            <thead>
                <tr>
                    <th scope="col" @click="sort('market_cap_rank')"># <div class="fa fa-sort"></div></th>
                    <th scope="col">Image</th>
                    <th scope="col" @click="sort('name')">Name <div class="fa fa-sort"></div></th>
                    <th scope="col" @click="sort('symbol')">Symbol <div class="fa fa-sort"></div></th>
                    <th scope="col" @click="sort('current_price')">Current Price <div class="fa fa-sort"></div></th>
                    <th scope="col" @click="sort('price_change_24h')">Price Change 24h <div class="fa fa-sort"></div></th>
                    <th scope="col" @click="sort('price_change_percentage_24h')">% Change 24h <div class="fa fa-sort"></div></th>
                    <th scope="col" @click="sort('last_updated')">Last Updated <div class="fa fa-sort"></div></th>
                    <th scope="col">Options</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="crypto in sortedCrypto" :key="crypto.id">
                    <th scope="row">{{ crypto.market_cap_rank }}</th>
                    <th scope="row"><img :src="crypto.image" alt="Crypto" id="em_photo"></th>
                    <td scope="row"><b>{{ crypto.name }}</b></td>
                    <td scope="row">{{ crypto.symbol }}</td>
                    <td scope="row">${{ crypto.current_price.toFixed(2) }}</td>
                    <td scope="row" :class="[PercentageColor(crypto.price_change_24h) ? 'text-success' : 'text-danger']">{{ crypto.price_change_24h.toFixed(3) }}</td>
                    <td scope="row" :class="[PercentageColor(crypto.price_change_percentage_24h) ? 'text-success' : 'text-danger']">{{ crypto.price_change_percentage_24h.toFixed(3) }}%</td>
                    <td scope="row">{{ formatDate(crypto.last_updated) }}</td>
                    <td scope="row"><button @click="goTrade(crypto.name, crypto.current_price, crypto.symbol)" class="btn btn-warning">Trade</button></td>
                </tr>
            </tbody>
        </table>
        <p v-else id="textBottom" class="text-center">Could Not Find Cryptocurrency</p>
        <h1 v-if="!!error" id="textBottom" class="text-center"> {{ error }}</h1>
        <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item" :class="currentPage == 1 ? 'disabled' : ''" @click="changePage(currentPage - 1)">
                    <button class="page-link" href="#">Previous</button>
                </li>
                <li class="page-item" :class="currentPage == 1 ? 'disabled' : ''"><button class="page-link" @click="changePage(1)">1</button></li>
                <li class="page-item" :class="currentPage == 2 ? 'disabled' : ''"><button class="page-link" @click="changePage(2)">2</button></li>
                <li class="page-item" :class="currentPage == 3 ? 'disabled' : ''"><button class="page-link" @click="changePage(3)">3</button></li>
                <li class="page-item" :class="currentPage == 4 ? 'disabled' : ''"><button class="page-link" @click="changePage(4)">4</button></li>
                <li class="page-item" :class="currentPage == 4 ? 'disabled' : ''">
                    <button class="page-link" @click="changePage(currentPage + 1)">Next</button>
                </li>
            </ul>
        </nav>

        <div class="text-center">
            <div class="spinner-border text-primary" role="status" v-if="isLoading">
                <span class="sr-only">Page Is Loading...</span>
            </div>
        </div>
    </div>

</template>

<script>
import { mapGetters } from 'vuex'
import loadData from '../mixins/cryptoMixins/loadData.js';

export default {
    data () {
        return {
            currentPage: 1,
            limit: 5,
            timer: '',
            isLoading: false,
            currentSort:'market_cap_rank',
            currentSortDir:'asc'
        }
    },
    mixins: [loadData],
    mounted () {
        this.loadData();

        this.timer = setInterval(this.loadHighest, 1000);
    },
    methods: {
        formatDate(date) {
            const event = new Date(date);

            return event.toLocaleString('en-US');
        },
        changePage(number) {
            this.currentPage = number;

            this.loadHighest();
        },
        async loadHighest() {
            const payload = {
                orderType: 'market_cap_desc',
                perPage: 25,
                currentPage: this.currentPage,
            }

            this.StatusSpinner();

            try {
                await this.$store.dispatch('highestCrypto', payload);
            } catch(error) {
                console.log(error);
                this.error = error;
            };

            this.StatusSpinner();
        },
        async loadData() {
            this.StatusSpinner();
            const payload4 = {
                orderType: 'market_cap_desc',
                perPage: 5,
                currentPage: 1,
            }

            const payload1 = {
                orderType: 'market_cap_desc',
                perPage: 25,
                currentPage: this.currentPage,
            }

            const payload2 = {
                orderType: 'gecko_desc',
                perPage: 5,
                currentPage: 1,
            }

            const payload3 = {
                orderType: 'volume_desc',
                perPage: 5,
                currentPage: 1,
            }

            try {
                await this.$store.dispatch('highestCrypto', payload1);
                await this.$store.dispatch('trendyCrypto', payload2);
                await this.$store.dispatch('volumeCrypto', payload3);
                await this.$store.dispatch('currentPageCrypto', payload4);
            } catch(error) {
                console.log(error);
                this.error = error;
            };

            this.StatusSpinner();
        },
        cancelAutoUpdate () {
            clearInterval(this.timer);
        },
        goTrade(name, price, cryptoSymbol) {
            const payload = { name, price, cryptoSymbol }

            this.$store.dispatch('cryptoAssignment', payload);

            const redirectURL = '/' + (this.$route.query.redirect || 'buy');

            this.$router.replace(redirectURL);
        },
        StatusSpinner() {
            this.isLoading = !this.isLoading;
        },
        sort:function(s) {
            //if s == current sort, reverse
            if(s === this.currentSort) {
            this.currentSortDir = this.currentSortDir==='asc'?'desc':'asc';
            }
            this.currentSort = s;
        }
    },
    computed:{
        sortedCrypto:function() {
            return this.filterSearch.sort((a,b) => {
                let modifier = 1;
                if(this.currentSortDir === 'desc') modifier = -1;
                if(a[this.currentSort] < b[this.currentSort]) return -1 * modifier;
                if(a[this.currentSort] > b[this.currentSort]) return 1 * modifier;
                return 0;
            });
        },
        ...mapGetters([
            'retrieveTrendyCryptoData',
            'retrieveVolumeCryptoData',
            'retrieveSelectedCurrentPageCrypto',
        ]),
    },
    beforeDestroy() {
        this.cancelAutoUpdate();
    }
}
</script>

<style scoped>
    #em_photo {
        height: 40px;
        width: 40px;
    }

    .card {
        background: #212529;
    }

    .search {
        border: 2px solid black;
        width: 250px;
    }

    .page-link {
        color: #F7931A;
        background-color: #343a40;
        border-color: #343a40;
    }

    .page-link:disabled {
        background-color: red;
    }

    p {
        color: white;
    }

    h4 {
        color: white;
    }

    #textBottom {
        color: white;
        font-size: 36px;
    }

</style>