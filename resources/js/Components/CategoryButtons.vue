<template>
    <!-- Toggle que maneja la selección de categorías -->
    <v-btn-toggle v-model="internalSelected" mandatory class="category-btn-toggle">
        <v-btn size="small" v-for="option in options" :key="option.value" :value="option.value" class="my-pill-btn mx-2"
            :class="{ 'my-pill-btn--active': internalSelected === option.value }">
            {{ option.label }}
        </v-btn>
    </v-btn-toggle>
</template>

<script setup>
import { ref, watch } from 'vue'

// 1. Definir props y emits para soportar v-model
const props = defineProps({
    /**
     * Este será el valor que venga desde el padre
     * usando v-model="algo" o v-bind:modelValue="algo"
     */
    modelValue: {
        type: String,
        default: 'todo'
    }
})

const emit = defineEmits(['update:modelValue'])

// 2. Variable interna que replicará el valor del prop
const internalSelected = ref(props.modelValue)

// 3. Observa cambios en la variable interna para emitirlos al padre
watch(() => internalSelected.value, (newVal) => {
    emit('update:modelValue', newVal)
})

// Opciones de ejemplo
const options = [
    { value: 'todo', label: 'Todo' },
    { value: 'barberia6', label: 'Barbería456' },
    { value: 'cuidado', label: 'Cuidado' },
    { value: 'lociones', label: 'Lociones' }
]
</script>

<style scoped>
/* 
  El contenedor principal que permite scroll horizontal 
  - white-space: nowrap evita que los ítems bajen de línea
  - overflow-x: auto muestra la barra de desplazamiento si excede el ancho
*/

.category-btn-toggle {
    padding: 12px;
    border-radius: 15px;
    overflow-x: auto;
    overflow-y: hidden;
    max-width: 100%;
    padding-bottom: 0.5rem;
}

/* Botón estilo “pill” */
.my-pill-btn {
    border-radius: 9999px;
    background-color: #CFD8DC;
    color: #333;
    min-width: 80px;
}

/* Botón activo */
.my-pill-btn--active {
    background-color: #00BCD4 !important;
    color: #fff !important;
}
</style>