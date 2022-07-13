// Import of the bootstrap file
require('./bootstrap');

// Import of the Vue3 app:
import { createApp, defineAsyncComponent } from 'vue';

// Import of Axios and VueAxios:
import axios from 'axios'
import VueAxios from 'vue-axios'

// Import of the router, the Vuex store, the Vue3 app and the global components used throught the application:
import router from './router';
import store from './store';
import App from './App.vue';
import BaseCard from './components/ui/BaseCard.vue';
import BaseButton from './components/ui/BaseButton.vue';
import BaseSpinner from './components/ui/BaseSpinner.vue';
import Sidebar from './components/layouts/sidebar.vue';

// I imported BaseDialog component as Async as we don't need it right away in the loading of the app:
const BaseDialog = defineAsyncComponent(() => import('./components/ui/BaseDialog.vue'));

// Sweet Alert is a popular public package used for alerts inside the application:
// Sweet Alert setup start
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
// Sweet alert setup end

// We attribute all the imported stuff to the Vue3 application then we mount it in order to be able to use it:
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