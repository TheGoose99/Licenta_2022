<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <div class="row mb-3">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-uppercase mb-1">Today's sold cryptos amount</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800"> {{ today_Solds }} Units </div>
                            <div class="mt-2 mb-0 text-muted text-xs">
                                <span class="text-success mr-2"><i :class="positiveNegative(sells_Evolution) ? 'text-success fa fa-arrow-up' : 'fa fa-arrow-down text-danger'"></i>{{ income_Evolution }}%</span>
                                <span>Since yesterday</span>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-primary"></i>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Today's income</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">$ {{ today_Income }}</div>
                                <div class="mt-2 mb-0 text-muted text-xs">
                                    <span class="text-success mr-2"><i :class="positiveNegative(income_Evolution) ? 'text-success fa fa-arrow-up' : 'fa fa-arrow-down text-danger'"></i> {{ income_Evolution }}%</span>
                                    <span>Since last years</span>
                                </div>
                            </div>
                            <div class="col-auto">
                            <i class="fas fa-shopping-cart fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-uppercase mb-1">Today's due</div>
                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">$ {{ today_Due }}</div>
                            <div class="mt-2 mb-0 text-muted text-xs">
                                <span class=" mr-2"><i :class="positiveNegative(expenses_Evolution) ? 'text-success fa fa-arrow-up' : 'fa fa-arrow-down text-danger'"></i> {{ expenses_Evolution }}%</span>
                                <span>Since last month</span>
                            </div>
                        </div>
                        <div class="col-auto">
                        <i class="fas fa-users fa-2x text-info"></i>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Today's Expenses</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">$ -{{ today_Expense }}</div>
                                <div class="mt-2 mb-0 text-muted text-xs">
                                    <span class=" mr-2"><i :class="positiveNegative(due_Evolution) ? ' text-danger fa fa-arrow-up' : 'fa fa-arrow-down text-success'"></i> {{ due_Evolution }}%</span>
                                    <span>Since yesterday</span>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 mb-4">
            <!-- Simple Tables -->
                <div class="card">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Out of Stock Cryptocurrencies</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush" v-if="missing_crypto.length">
                            <thead class="thead-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Code</th>
                                    <th>Photo</th>
                                    <th>Last Bought At</th>
                                    <th>Status</th>
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="stock in missing_crypto" :key="stock.id">
                                    <td> {{ stock.name }} </td>
                                    <td> {{ stock.symbol }} </td>
                                    <td scope="row"><img :src="stock.image" alt="Stock" id="em_photo"></td>
                                    <td> {{ stock.bought_price }} </td>
                                    <td>
                                        <base-badge title="Out Of Stock" :class="'option4'" id="badge"></base-badge>
                                    </td>
                                    <td> {{ stock.volume }} </td>
                                    <td>
                                        <button class="btn btn-success btn-rounded" @click="addStock()">Replenish Stock</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <h4 v-else class="text-dark text-center p-3">No cryptocurrencies need refilling</h4>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import BaseBadge from '../ui/BaseBadge.vue';

export default {
    components: {
        BaseBadge,
    },
    data() {
        return {
            today_Solds: '',
            today_Income: '',
            today_Due: '',
            today_Expense: '',
            sells_Evolution: '',
            income_Evolution: '',
            expenses_Evolution: '',
            due_Evolution: '',
            error: '',
            missing_crypto: '',
        }
    },
    created() {
        this.outOfStock();
    },
    methods: {
        async outOfStock() {
            try {
                const response = await axios.get('/api/admin/stocks/outOfStock');
                this.missing_crypto = response.data;

                const response2 = await axios.get('/api/admin/stocks/todaySells');
                this.today_Solds = response2.data.sells.toFixed(2);
                this.today_Income = response2.data.income.toFixed(2);
                this.today_Due = response2.data.due.toFixed(2);
                this.today_Expense = response2.data.expenses.toFixed(2);

                this.sells_Evolution = response2.data.sells_yesterday.toFixed(2);
                this.income_Evolution = response2.data.income_yesterday.toFixed(2);
                this.expenses_Evolution = response2.data.expenses_yesterday.toFixed(2);
                this.due_Evolution = response2.data.due_yesterday.toFixed(2);
            } catch (error) {
                console.log(error);
                this.error = error;
            }
        },
        handleError() {
            this.error = false;
        },
        addStock() {

            const redirectURL = '/' + (this.$route.query.redirect || 'admin/vendor');

            this.$router.replace(redirectURL);
        },
        positiveNegative(number) {
            if(number > 0) {
                return true;
            }
            return false;
        }
    },
}
</script>

<style scoped>
#em_photo {
        height: 40px;
        width: 40px;
    }

#badge {
    width: 160px;
    height: 32px;
    font-size: 16px;
}
</style>