<template>
    <Header />
    <Carousel />

    <!-- Botones de categoría  -->
    <v-container class="mt-1">
        <CategoryButtons v-model="selectedCategory" />
    </v-container>

    <!-- Lista de servicios filtrados según la categoría -->
    <ServicesList :selected-category="selectedCategory" />

    <!-- Botón flotante de WhatsApp -->
    <FloatingWhatsapp />

</template>

<script>
import Header from '@/components/Header.vue'
import Carousel from '@/components/Carousel.vue'
import CategoryButtons from '@/components/CategoryButtons.vue'
import ServicesList from '@/components/ServicesList.vue'
import FloatingWhatsapp from '@/components/FloatingWhatsapp.vue'

export default {
    name: 'Home',
    components: {
        Header,
        Carousel,
        CategoryButtons,
        ServicesList,
        FloatingWhatsapp
    },
    data() {
        return {
            selectedCategory: 'todo' // valor por defecto
        }
    }
}
</script>