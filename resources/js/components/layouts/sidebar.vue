<template>
    <div>
        <nav class="navbar navbar-expand d-flex flex-column align-item-start">
            <hr id="separator">
            <ul class="navbar-nav d-flex flex-column mt-5 w-100">
                <li class="nav-item w-100" style="border-top: 3px solid #4f5256;">
                    <router-link :to=" { name: 'dashboard' } "><p @click="emitRoute('dashboard')" class="nav-link has-icon text-light pl-4 text-center"><i class="fa-solid fa-gauge"></i> Dashboard </p></router-link>
                </li>
                <hr id="separator">
                <li class="nav-item w-100">
                    <router-link :to=" { name: 'statistics' } "><p @click="emitRoute('inventory')" class="nav-link has-icon text-light pl-4 text-center"><i class="fas fa-dollar-sign"></i> Statistics </p></router-link>
                </li>
                <hr id="separator">
                <div class="text-light text-center h4">
                    CRUD Features
                </div>
                <hr class="text-light">
                <li class="nav-item w-100 has-submenu">
                    <div class="dropdown">
                        <a class="btn dropdown-toggle nav-link text-light pl-4" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user"></i>User
                        </a>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownMenuButton1">
                            <div class="text-center text-light">
                                <li><router-link :to=" { name: 'users' } "><h6 @click="emitRoute('users')" class="dropdown-item"><i class="fas fa-users"></i> All Users</h6></router-link></li>
                                <li><router-link :to=" { name: 'createUser' } "><h6 @click="emitRoute('create-user')" class="dropdown-item"><i class="fas fa-user-plus"></i> Create User</h6></router-link></li>
                            </div>
                        </ul>
                    </div>
                </li>
                <hr class="text-light">
                <li class="nav-item w-100 has-submenu">
                    <div class="dropdown">
                        <a class="btn dropdown-toggle nav-link text-light pl-4" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-secret"></i>Roles
                        </a>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownMenuButton1">
                            <div class="text-center text-light">
                                <li><router-link :to=" { name: 'roles' } "><h6 @click="emitRoute('roles')" class="dropdown-item"><i class="fas fa-unlock"></i> All Roles</h6></router-link></li>
                                <li><router-link :to=" { name: 'createRole' } "><h6 @click="emitRoute('add-role')" class="dropdown-item"><i class="fas fa-user-lock"></i> Add Role</h6></router-link></li>
                            </div>
                        </ul>
                    </div>
                </li>
                <hr class="text-light">
                <li class="nav-item w-100 has-submenu">
                    <div class="dropdown">
                        <a class="btn dropdown-toggle nav-link text-light pl-4" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-clipboard-list"></i>Stocks
                        </a>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownMenuButton1">
                            <div class="text-center text-light">
                                <li><router-link :to=" { name: 'stocks' } "><h6 @click="emitRoute('roles')" class="dropdown-item"><i class="fab fa-bitcoin"></i> All Available Stocks</h6></router-link></li>
                                <li><router-link :to=" { name: 'vendor' } "><p @click="emitRoute('vendor')" class="nav-link has-icon text-light pl-4 text-center"><i class="fas fa-shopping-bag"></i> Vendor </p></router-link></li>
                            </div>
                        </ul>
                    </div>
                </li>
                <hr id="separator">
            </ul>
        </nav>
    </div>
</template>

<script>
export default {
    methods: {
        emitRoute(payload) {
            this.$store.commit('setComponent', payload)
        },
    }
}
</script>

<style scoped>

    #separator{
        background-color: white;
        height: 3px;
    }

    .navbar {
        width: 250px;
        height: 100vh;
        position: fixed;
        background-color: transparent;
        transition: 0.4s;
        border-right: 3px solid #4f5256;
    }

    .nav-link {
        font-size: 1.25em;
    }

    .nav-link:active,
    .nav-link:focus,
    .nav-link:hover {
        background-color: #ffffff26;
    }

    .dropdown-menu {
        background-color: #181a20;
    }

    .dropdown-item {
        color: white;
    }

    .dropdown-item:hover {
        background-color: #5b5b5b;
    }

    .dropdown-menu:active,
    .dropdown-menu:focus,
    .dropdown-menu:hover {
        background-color: #ffffff26;
    }

    .my-container {
        transition: 0.4s;
    }

    .active-nav{
        margin-left: 0;
    }

    .active-cont {
        margin-left: 250px;
    }

    a { text-decoration: none; }
</style>