<template>
    <!-- Si la categoría es "todo", mostramos cada categoría en un carousel independiente -->
    <div v-if="selectedCategory === 'todo'">
        <!-- Recorremos el objeto resultante de agrupar servicios -->
        <div v-for="(servicesArray, cat) in groupedByCategory" :key="cat" class="mb-2">

            <div class="d-flex justify-space-between pa-1">
                <h3 class="text-overline font-weight-bold pa-3" style="color: #00BCD4;">{{ cat }}</h3>
                <v-btn icon variant="text" class="my-auto pa-3" @click="onSeeMore(cat)">
                    <v-icon color="#00BCD4">mdi-chevron-right</v-icon>
                </v-btn>
            </div>
            <v-divider class="mb-5 mx-5" />

            <v-slide-group>
                <v-slide-group-item v-for="service in servicesArray" :key="service.id">
                    <v-card class="mx-2 flexcard rounded-lg" max-width="200">
                        <v-img class="align-end text-white" max-height="100px" :src="service.image" cover>
                            <v-card-title>
                                <div class="service-category-badge-all rounded-b-lg">
                                    {{ service.title }}
                                </div>
                            </v-card-title>
                        </v-img>

                        <v-card-subtitle class="pt-2">
                            {{ formatPrice(service.price) }}
                        </v-card-subtitle>

                        <v-card-text>
                            <div>{{ service.description }}</div>
                            <v-icon size="large" color="#00BCD4" style="position: absolute; bottom: 0; right: 0;">
                                mdi-chevron-double-right
                            </v-icon>
                        </v-card-text>
                    </v-card>

                </v-slide-group-item>
            </v-slide-group>

        </div>
    </div>

    <!-- Si la categoría NO es "todo", mostramos la lista tradicional -->
    <div v-else>
        <v-row dense>
            <v-col v-for="service in filteredServices" :key="service.id" cols="12">
                <v-card variant="text" color="transparent" elevation="0">
                    <v-row align="center" no-gutters>
                        <!-- Columna de la imagen -->
                        <v-col cols="auto" class="pr-4 position-relative">
                            <div class="ma-3">
                                <v-img :aspect-ratio="1" class="bg-black rounded-t-lg" :src="service.image"
                                    width="85" />
                                <div class="service-category-badge rounded-b-lg">
                                    {{ service.shortCategory || service.categoryLabel }}
                                </div>
                            </div>
                        </v-col>

                        <!-- Columna del contenido principal (título, descripción, precio) -->
                        <v-col>
                            <div class="text-body-1 font-weight-bold mb-2" style="color: #333">
                                {{ service.title }}
                            </div>
                            <div class="text-caption mb-2" style="color: #333">
                                {{ service.description }}
                            </div>
                            <div class="text-medium-emphasis font-weight-bold mb-2">
                                {{ formatPrice(service.price) }}
                            </div>
                        </v-col>

                        <!-- Columna del ícono de flecha (ir a detalle, etc.) -->
                        <v-col cols="auto" class="text-center">
                            <v-icon size="large" color="#00BCD4">
                                mdi-chevron-double-right
                            </v-icon>
                        </v-col>
                    </v-row>
                </v-card>
                <v-divider class="mx-4" />
            </v-col>
        </v-row>
    </div>
</template>

<script>
export default {
    name: 'ServicesList',
    props: {
        selectedCategory: {
            type: String,
            default: 'todo'
        }
    },
    data() {
        return {
            services: [
                {
                    id: 1,
                    category: 'barberia',
                    categoryLabel: 'Corte de cabello',
                    shortCategory: this.truncatedText('Corte de Cabello', 10),
                    title: 'Corte de Cabello',
                    description: 'Renueva tu estilo con cortes de cabello modernos',
                    price: 18000,
                    image: 'https://i.pinimg.com/236x/4e/58/1c/4e581c07ad20f46ff814bfecfd801623.jpg'
                },
                {
                    id: 2,
                    category: 'barberia',
                    categoryLabel: this.truncatedText('Barba', 10),
                    title: 'Barba',
                    description: 'Mantén tu barba perfectamente recortada y cuidada',
                    price: 8000,
                    image: 'https://i.pinimg.com/236x/18/47/73/184773a42d076fb4a4e610f626851c41.jpg'
                },
                {
                    id: 3,
                    category: 'barberia',
                    categoryLabel: this.truncatedText('Barba + Corte', 10),
                    title: 'Barba + Corte',
                    description: 'Combo de corte de cabello y arreglo de barba',
                    price: 25000,
                    image: 'https://i.pinimg.com/236x/19/b7/b5/19b7b5f479d6b3ce137c90ca535f4e40.jpg'
                },
                {
                    id: 4,
                    category: 'lociones',
                    categoryLabel: this.truncatedText('Locion CH', 10),
                    title: 'Locion CH',
                    description: 'Fragancia para hombres y mujeres',
                    price: 2800,
                    image: 'https://i.pinimg.com/236x/57/b6/96/57b69658bff2ed8d4159918d092dc776.jpg'
                },
                {
                    id: 5,
                    category: 'lociones',
                    categoryLabel: this.truncatedText('LaCoste', 10),
                    title: 'Locion LaCoste',
                    description: 'Fragancia para hombre',
                    price: 3200,
                    image: 'https://i.pinimg.com/236x/b4/f9/7e/b4f97e8362dc90b2befb728c990f4016.jpg'
                },
                {
                    id: 6,
                    category: 'barberia',
                    categoryLabel: this.truncatedText('cejas', 10),
                    title: 'cejas',
                    description: 'Mantén tus cejas perfectamente recortadas y cuidadas',
                    price: 4000,
                    image: 'https://i.pinimg.com/236x/59/cf/be/59cfbed2dfde3832753847463db39401.jpg'
                },
                {
                    id: 7,
                    category: 'barberia',
                    categoryLabel: this.truncatedText('Mascarilla y corte', 10),
                    title: 'Mascarilla y corte',
                    description: 'Mascarilla y corte de cabello',
                    price: 20000,
                    image: 'https://i.pinimg.com/236x/16/68/fe/1668fed37e41be971c7fa5b81398223d.jpg'
                },
                {
                    id: 8,
                    category: 'cuidado',
                    categoryLabel: this.truncatedText('Cera', 10),
                    title: 'Cera para cabello',
                    description: 'Productos de calidad para tu cabello',
                    price: 30000,
                    image: 'https://i.pinimg.com/236x/0a/a4/f4/0aa4f4e283db499aa26d195dba5af55d.jpg'
                },
                {
                    id: 9,
                    category: 'cuidado',
                    categoryLabel: this.truncatedText('Shampoo', 10),
                    title: 'Shampoo',
                    description: 'Shampoo para el cuidado de tu cabello',
                    price: 30000,
                    image: 'https://i.pinimg.com/236x/d9/d9/67/d9d967f90832c8be92a30033afcdbc41.jpg'
                },
                {
                    id: 10,
                    category: 'cuidado',
                    categoryLabel: this.truncatedText('Minoxidil', 10),
                    title: 'Minoxidil',
                    description: 'Recupera tu cabello con productos de calidad',
                    price: 42000,
                    image: 'https://i.pinimg.com/236x/bf/fd/a1/bffda1717f1b8bd7cecb05847f9092b4.jpg'
                }
            ]
        }
    },
    computed: {
        /**
         * Filtra los servicios por la categoría seleccionada.
         * Si "selectedCategory" es distinto de "todo", se devuelven sólo
         * los de esa categoría.
         */
        filteredServices() {
            if (this.selectedCategory === 'todo') {
                return this.services
            }
            return this.services.filter(
                (service) => service.category === this.selectedCategory
            )
        },

        /**
         * Agrupa los servicios por 'service.category'.
         * Se usa para mostrar un carousel por categoría cuando selectedCategory = 'todo'.
         */
        groupedByCategory() {
            const grouped = {}
            this.services.forEach((service) => {
                if (!grouped[service.category]) {
                    grouped[service.category] = []
                }
                grouped[service.category].push(service)
            })
            return grouped
        }
    },
    methods: {
        truncatedText(text, length = 7) {
            if (!text) return ''
            return text.length > length ? text.slice(0, length) + '...' : text
        },
        formatPrice(price) {
            return new Intl.NumberFormat('es-CL', {
                style: 'currency',
                currency: 'CLP'
            }).format(price)
        },
        // Sólo a modo de ejemplo, un método "ver más" por categoría
        onSeeMore(category) {
            alert(`Ver más de la categoría: ${category}`)
        }
    }
}
</script>

<style scoped>
/* Etiqueta de categoría sobre la imagen (puedes ajustar su posición) */
.service-category-badge {
    max-width: 100%;
    background-color: #00BCD4;
    color: #fff;
    padding: 2px 6px;
    font-size: 0.75rem;
    white-space: nowrap;
}

.service-category-badge-all {
    max-width: 100%;
    background-color: #00BCD4;
    color: #fff;
    padding: 2px 6px;
    font-size: 0.75rem;
    white-space: nowrap;
    position: absolute;
    top: 0;
    left: 0;
}

/* Ajusta el espacio entre carousels */
.mb-8 {
    margin-bottom: 2rem;
}
</style>