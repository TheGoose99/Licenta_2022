<template>
    <div class="container">
        <div class="d-flex align-items-center vh-100">
            <div class="box w-100">
                <div class="d-grid gap-3">
                    <h1 class="p-2 bd-highlight" id="stuff">Limitless Crypto Exchange</h1>
                    <p class="p-2 bd-highlight"> Fast, simple, non-custodial Echange Service</p>
                    <p class="p-2 bd-highlight">with 25+ cryptocurrencies. Exchanges With Life</p>
                    <div class="p-2 bd-highlight">
                        <router-link to="/buy"><button class="btn btn-warning" id="btn">Buy Now</button></router-link>
                    </div>
                </div>
            </div>
            <div class="justify-content-end">
                <img class="img-fluid" src="../../../public/backend/images/btc.png">
            </div>
        </div>
    </div>
</template>

<script>
export default {
}
</script>

<style scoped>

p {
    color: white;
    font-size: 24px;
    font-family: 'Trebuchet MS', sans-serif;
    position: relative;
    left: -90px;
}

#stuff {
    font-size: 40px;
    font-family: 'Trebuchet MS', sans-serif;
    position: relative;
    left: -90px;
}

#btn {
    height: 50px;
    width: 175px;
    border: 1px solid black;
    position: relative;
    left: -90px;
}
</style>