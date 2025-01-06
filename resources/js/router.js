/* router.js */
import { createRouter, createWebHistory } from "vue-router";
import Home from "./Pages/Home.vue";
import NotFound from "./Components/NotFound.vue";

const routes = [
  { path: "/",  name: 'Home',component: Home },
  { path: "/:pathMatch(.*)*", component: NotFound },
];

const history = createWebHistory();

const router = createRouter({
  history,
  routes,
});

export default router;