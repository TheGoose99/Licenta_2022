require('./bootstrap');

import { createApp, defineAsyncComponent } from 'vue';

import axios from 'axios'
import VueAxios from 'vue-axios'

import router from './router';
import store from './store';
import App from './App.vue';
import BaseCard from './components/ui/BaseCard.vue';
import BaseButton from './components/ui/BaseButton.vue';
import BaseSpinner from './components/ui/BaseSpinner.vue';
import Sidebar from './components/layouts/sidebar.vue';

const BaseDialog = defineAsyncComponent(() => import('./components/ui/BaseDialog.vue'));

// Sweet Alert start
import Swal from 'sweetalert2';
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
})

window.Toast = Toast;

const app = createApp(App);

app.use(router);
app.use(store);

app.component('BaseCard', BaseCard);
app.component('BaseButton', BaseButton);
app.component('BaseSpinner', BaseSpinner);
app.component('BaseDialog', BaseDialog);
app.component('Sidebar', Sidebar);

app.use(VueAxios, axios);

app.mount('#app');