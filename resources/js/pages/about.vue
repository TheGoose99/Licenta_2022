<template>
    <div id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="about_border border border-primary rounded-3">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="titlepage text_align_left">
                                    <h2>About Us</h2>
                                </div>
                                <div class="about_text">
                                    <p>Our vision is to increase the freedom of money globally. We believe that by spreading this freedom, we can significantly improve lives around the world </p>
                                    <router-link class="btn btn-warning" to="/market">Explore our market</router-link>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="about_img">
                                    <figure><img class="img_responsive" src="../../../public/backend/images/about2.png" alt="#" /></figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scope>

h2 {
    color: whitesmoke;
    font-size: 48px;
    font-weight: bold;
}

.btn {
    font-size: 18px;
}

.about {
padding: 120px 0 60px 0;
}

.about_border {
padding: 80px 80px;
background: #04133a;
}

.about .titlepage {
padding-bottom: 0;
margin-bottom: 0px;
}

.about_text {
float: right;
max-width: 554px;
width: 100%;
text-align: left;
}

.about_text p {
color: whitesmoke;
line-height: 33px;
padding-top: 30px;
font-weight: 400;
padding-bottom: 40px;
font-size: 24px;
}

.about_img {
float: right;
}

.about_img figure {
margin: 0;
}
</style>