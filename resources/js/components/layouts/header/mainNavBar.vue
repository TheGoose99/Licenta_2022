<template>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark p-md-3" :style="{ color: navColors[$route.path] }">
        <div class="container">
            <router-link to="/" class="navbar-brand"><h1>Proiect Licenta</h1></router-link>
            <button
                type="button"
                class="navbar-toggler"
                data-bs-target="#navbar"
                data-bs-toggle="collapse"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-lable="Toggle Navbar"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-auto"></div>
                <div class="menu">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <router-link to="/buy" class="nav-link text-white">Buy Crypto</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="/market" class="nav-link text-white">Market</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="/about" class="nav-link text-white">About</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="/admin" class="nav-link text-white">Admin Panel</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link v-if="!isLoggedIn" to="/signup" class="nav-link text-white">Signup</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link v-if="!isLoggedIn" to="/login" class="nav-link text-white">Login</router-link>
                        </li>
                        <li class="nav-item dropdown" v-if="isLoggedIn">
                            <h3 class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Welcome back, {{ Username }}
                            </h3>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><router-link class="dropdown-item" to="/profile"><i class="fa-solid fa-pen-to-square"></i> Settings </router-link></li>
                                <li><base-button mode="navlink" @click="logout" class="dropdown-item text-white"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</base-button></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</template>

<script>
import { mapMutations } from 'vuex';

export default {
    data() {
        return {
            navColors: {
                '/buy': 'black',
            },
        }
    },
    methods: {
        logout() {
            Swal.fire({
            title: 'Are you sure you want to log out?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Log me out'
            }).then((result) => {
            if (result.isConfirmed) {
                this.$store.dispatch('logout');

                this.$router.replace('/login');
                }
            })
        },
        ...mapMutations(['loginVerify']),
    },
    computed: {
        isLoggedIn() {
            return this.$store.getters.isAuthenticated;
        },
        Username() {
            return this.$store.getters.userName;
        }
    },
    created() {
        this.loginVerify();
    },
}
</script>

<style scoped>
:root {
    --primary: #F7931A;
    --light: #EEEEEE;
    --dark: #212121;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Fira sanss', 'sans-serif';
}

.container {
    max-width: 1280px;
    margin: 0 auto;
    display: flex;
    align-items:center;
    justify-content: space-between;
}

nav {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 99;
    padding: 16px 32px;
    opacity: 0.9;
    background-color: rgb(23, 25, 34);
}

h1 {
    color: #FFF;
    font-size: 28px;
    font-weight: 900;
    letter-spacing: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
}


.menu a:active,
.menu a.router-link-active {
    border-radius: 15px;
    border: 3px #F7931A solid;
}

a::active,
a::hover,
a.router-link-active {
    width: 100% ;
	transition: width .3s;
}

@media(min-width: 768px) {
    .menu {
        display: flex;
    }
}

.menu {
    flex: 1 1 0%;
    justify-content: flex-end;
    margin: 0 -16px;
}

.menu a, h3 {
    color: #fff;
    margin: 0 16px;
    font-weight: 600;
    text-decoration: none;
    transition: 0.4s;
    padding: 8px 16px;
    border-radius: 99px;
    font-size: 18px;
}

.menu a::after {
	content: '';
    display: block;
	width: 0;
	height: 2px;
	background: #fff;
	transition: width .3s;
}

.menu a:hover::after {
	width: 100% ;
	transition: width .3s;
}

#user-icon {
    color: #fff;
    margin: 0 16px;
    transition: 0.4s;
    padding: 8px 16px;
    border-radius: 99px;
    color: ivory;
    font-size: 24px;
}

#btn {
    background-color: transparent;
}

.dropdown-menu{
   /* metade transparente: alpha = .5 */
    background-color: #181a20;
    min-width: 60px !important;
}

#navbarDarkDropdownMenuLink {
    color: #fff;
}

</style>