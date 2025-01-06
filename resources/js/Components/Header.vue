<template>
  <v-card class="mx-auto" color="grey-lighten-3">
    <v-layout>
      <v-app-bar color="teal-darken-4" image="https://barber-family-app.s3.us-east-2.amazonaws.com/logo/Barber%20Family-1723740864252-barber-family-logo-blanco.jpg">
        <template v-slot:image>
          <v-img gradient="to top right, rgba(34,34,34,.8), rgba(173,173,173,.8)"></v-img>
        </template>

        <template v-slot:prepend>
          <v-app-bar-nav-icon @click="menu = !menu">
          </v-app-bar-nav-icon>
        </template>

        <v-avatar size="40" class="me-2">
          <v-img
            src="https://barber-family-app.s3.us-east-2.amazonaws.com/logo/Barber%20Family-1723740864252-barber-family-logo-blanco.jpg"
            cover alt="Logo" />
        </v-avatar>
        <span class="text-body1 mx-auto">Turnos</span>

        <v-spacer></v-spacer>

        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-heart</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
      </v-app-bar>
    </v-layout>
  </v-card>
</template>

<script>
export default {
  name: "Header",
  data: () => ({
    menu: false
  })
};
</script>

<style scoped>
.v-app-bar {
  position: static !important;
}
</style>