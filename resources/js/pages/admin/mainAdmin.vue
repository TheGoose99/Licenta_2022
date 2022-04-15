<template>
    <div>
        <sidebar></sidebar>
        <div class="container">
            <div class="row gutters-sm">
                <div class="vh-100 d-flex justify-content-end align-items-center">
                    <div class="col-md-10">
                        <div class="card" style="bottom: 75px;">
                            <div class="card-body tab-content">
                                <keep-alive>
                                    <component :is="retrieveComponentMethod"></component>
                                </keep-alive>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { defineAsyncComponent } from 'vue';

import dashboard from '../../components/admin/dashboard.vue';

export default {
    components: {
        dashboard,
        "users": defineAsyncComponent(() => import('../../components/admin/users/users.vue')),
        "create-user": defineAsyncComponent(() => import('../../components/admin/users/create-user.vue')),
        "edit-user": defineAsyncComponent(() => import('../../components/admin/users/edit-user.vue')),
        "roles": defineAsyncComponent(() => import('../../components/admin/roles/roles.vue')),
        "add-role": defineAsyncComponent(() => import('../../components/admin/roles/add-role.vue')),
        "edit-role": defineAsyncComponent(() => import('../../components/admin/roles/edit-role.vue')),
    },
    mounted() {
        this.$store.commit('setComponent', 'dashboard')
    },
    computed: {
        retrieveComponentMethod () {
            return this.$store.getters.retrieveComponent;
        },
    },
}
</script>

<style scoped>
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

</style>