import './bootstrap';

import { createApp } from 'vue';
import App from './Components/App.vue';
import router from "./router";
import vuetify from '../Plugins/vuetify.js';

const app = createApp(App);
app.use(router);
app.use(vuetify);
app.mount('#app');