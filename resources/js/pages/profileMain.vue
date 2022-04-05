<template>
    <div class="container">
        <div class="row gutters-sm" id="bitLower">
            <profile-routing></profile-routing>
            <div class="col-md-8">
                <div class="card">
                    <profileRoutesNav></profileRoutesNav>
                    <div class="card-body tab-content">
                        <div class="tab-pane active" id="profile">
                            <keep-alive>
                                <component :is="retrieveComponentMethod"></component>
                            </keep-alive>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { defineAsyncComponent } from 'vue';

import profileRouting from '../components/settings/profileRouting.vue';
import profileRoutesNav from '../components/settings/profileRoutesNav.vue';
import profileView from '../components/settings/profileView.vue';

export default {
    components: {
        profileView,
        profileRouting,
        profileRoutesNav,
        "profileEdit": defineAsyncComponent(() => import('../components/settings/profileEdit.vue')),
        "changePassword": defineAsyncComponent(() => import('../components/settings/changePassword.vue')),
        "changeUsername": defineAsyncComponent(() => import('../components/settings/changeUsername.vue')),
        "biling": defineAsyncComponent(() => import('../components/settings/biling.vue')),
    },
    computed: {
        retrieveComponentMethod () {
            return this.$store.getters.retrieveComponent;
        },
    },
}
</script>

<style scoped>
body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;
}
.main-body {
    padding: 15px;
}

.nav-link {
    color: #4a5568;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}

#bitLower {
    padding-top: 90px;
}
</style>