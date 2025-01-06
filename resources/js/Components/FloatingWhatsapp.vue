<template>
    <!-- Enlace que abre un chat de WhatsApp -->
    <a :href="whatsappLink" class="whatsapp-float" target="_blank" rel="noopener noreferrer">
        <v-icon color="white" size="27">
            mdi-whatsapp
        </v-icon>
    </a>
</template>

<script setup>
/**
 * Reemplaza el número telefónico con el tuyo (formato internacional)
 * y ajusta el texto por defecto.
 */
const phoneNumber = '+3176824754'
const defaultText = '¡Hola! Estoy interesado en...'

// Generas el link con la API de WhatsApp
const whatsappLink = `https://wa.me/${phoneNumber}?text=${encodeURIComponent(defaultText)}`
</script>

<style scoped>
.whatsapp-float {
    position: fixed;
    width: 50px;
    height: 50px;
    bottom: 20px;
    /* Distancia desde abajo */
    right: 20px;
    /* Distancia desde la derecha */
    background-color: #25D366;
    /* Color oficial de WhatsApp */
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.3);
    z-index: 9999;
    /* Para que quede por encima de otros elementos */
}
</style>