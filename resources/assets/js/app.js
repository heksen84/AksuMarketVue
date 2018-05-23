require('./bootstrap');

import 'bootstrap/dist/css/bootstrap-grid.min.css'
import 'bootstrap-vue/dist/bootstrap-vue.min.css'

import Vue from 'vue'
import welcome from './views/welcome.vue'
import home from './views/home.vue'
import profile from './views/profile.vue'
import passwordreset from './views/auth/passwordreset.vue'
import login from './views/auth/login.vue'
import register from './views/auth/register.vue'

// bootstrap
import layout from 'bootstrap-vue/src/components/layout'
import form from 'bootstrap-vue/src/components/form'
import form_input from 'bootstrap-vue/src/components/form-input'
import form_group from 'bootstrap-vue/src/components/form-group'
import button from 'bootstrap-vue/src/components/button'

Vue.use(layout);
Vue.use(form);
Vue.use(form_input);
Vue.use(form_group);
Vue.use(button);

const app = new Vue({
    el: '#app',
    data: () => ({
    }),
    components: {
      welcome,
      profile,
      home,
      passwordreset,
      login,
      register }
});
