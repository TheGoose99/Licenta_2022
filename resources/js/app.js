// Folosim Bootstrap de-a lungul aplicatiei web:
require('./bootstrap');

// Import Vue3 si creem o aplicatie:
import { createApp, defineAsyncComponent } from 'vue'

// Importam componenta de baza in care se va desfasura aplicatia:
import App from './app.vue'

// Import rutele paginilor folosite in aplicatia web din fisierul router:
import router from "./router";

// Import functiile Vuex din fisierul store:
import store  from './store/index.js';

// Importam Axios pentru a face request-uri mai usor catre back-end
import axios from 'axios';
import VueAxios from 'vue-axios';

import BaseCard from './components/ui/BaseCard.vue';
import BaseButton from './components/ui/BaseButton.vue';

const BaseSpinner = defineAsyncComponent(() => import('./components/ui/BaseSpinner.vue'));
const BaseDialog = defineAsyncComponent(() => import('./components/ui/BaseDialog.vue'));

// Sweet Alert start
import Swal from 'sweetalert2';

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
window.Swal = Swal;

// Adaugam diferite componente globale, ce fisiere dorim sa importam si utiliza global si montam aplicatia pe id-ul "#app":
const app = createApp(App)

app.component('BaseCard', BaseCard)
app.component('BaseButton', BaseButton)
app.component('BaseDialog', BaseDialog)
app.component('BaseSpinner', BaseSpinner)
app.use(store)
app.use(router, axios, VueAxios)
app.mount("#app");