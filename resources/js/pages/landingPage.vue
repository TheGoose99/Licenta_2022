<template>
    <div class="container">
        <div class="d-flex align-items-center vh-100">
            <div class="box w-100">
                <div class="col-md-12">
                    <div class="bluid">
                        <h1 id="h1">Limitless Crypto Exchange</h1>
                        <p id="paragraph">Your Bitcoin Money Success with 100+ cryptocurrencies. A world without borders.
                        </p>
                    </div>
                    <div class="bd-highlight">
                        <router-link to="/buy"><button class="btn btn-warning" id="btnId">Buy Now</button></router-link>
                    </div>
                </div>
            </div>
            <div class="justify-content-end">
                <img class="img-fluid rounded" src="../../../public/backend/images/btc.png">
            </div>
        </div>
    </div>
</template>

<style scoped>

#paragraph {
    color: white;
    font-size: 32px;
    font-family: 'Trebuchet MS', sans-serif;
    position: relative;
}

#h1 {
    font-size: 42px;
    font-family: 'Trebuchet MS', sans-serif;
    position: relative;
}

#btnId {
    height: 50px;
    width: 175px;
    border: 1px solid black;
    position: relative;
}
</style>