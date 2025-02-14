<!-- Header.vue -->
<template>
  <!-- AppBar principal -->
  <v-card class="mx-auto" color="grey-lighten-3">
    <v-layout>
      <v-app-bar color="teal-darken-4"
        image="https://barber-family-app.s3.us-east-2.amazonaws.com/logo/Barber%20Family-1723740864252-barber-family-logo-blanco.jpg">
        <template v-slot:image>
          <v-img gradient="to top right, rgba(34,34,34,.8), rgba(173,173,173,.8)"></v-img>
        </template>

        <!-- Botón hamburguesa (menú lateral) -->
        <template v-slot:prepend>
          <v-app-bar-nav-icon @click="menu = !menu">
          </v-app-bar-nav-icon>
        </template>

        <!-- Avatar / Logo -->
        <v-avatar size="40" class="me-2">
          <v-img
            src="https://barber-family-app.s3.us-east-2.amazonaws.com/logo/Barber%20Family-1723740864252-barber-family-logo-blanco.jpg"
            cover alt="Logo" />
        </v-avatar>
        <span class="text-body1 mx-auto">Turnos</span>

        <v-spacer />

        <!-- BOTÓN DE BÚSQUEDA -->
        <v-btn icon @click="toggleSearchDialog">
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

  <!-- DIÁLOGO DE BÚSQUEDA -->
  <v-dialog v-model="searchOpen" transition="dialog-bottom-transition" width="auto" fullscreen class="mt-16">
    <v-card>
      <!-- CABECERA DEL DIALOG (TÍTULO Y BOTÓN CERRAR) -->

      <v-card-title style="position:sticky; top:0; z-index: 9999; background-color: #fff;">
        <v-icon class="me-2" color="teal-darken-4" @click="searchOpen = false">mdi-arrow-left</v-icon>
        <span class="text-body-1 font-weight-bold">¿Qué servicio estás buscando?</span>
        <v-text-field v-model="searchTerm" label="Buscar servicios" prepend-inner-icon="mdi-magnify" clearable
          class="mt-4" variant="outlined" />
      </v-card-title>

      <v-card-text>
        <!-- RESULTADOS FILTRADOS -->
        <div v-if="filteredServices.length">
          <div v-for="(services, category) in groupedResults" :key="category">
            <!-- NOMBRE DE LA CATEGORÍA -->

            <h1 class="text-overline font-weight-bold" style="color: #00BCD4;">{{ category }}</h1>
            <v-divider v-if="services.length > 1" />

            <!-- LISTA DE SERVICIOS DENTRO DE ESTA CATEGORÍA -->
            <v-list dense>
              <v-list-item v-for="serv in services" :key="serv.id" class="d-flex justify-space-between pa-1">
                <v-list-item-avatar>
                  <v-img class="bg-surface-variant rounded-t-lg mx-auto" max-height="100px" :src="serv.image" cover>
                    <v-card-title>
                      <div class="service-badge rounded-b-lg">
                        {{ serv.price }}
                      </div>
                    </v-card-title>
                  </v-img>
                </v-list-item-avatar>
                <v-list-item-content>
                  <v-list-item-title class="text-body1 font-weight-bold">
                    {{ serv.title }}
                  </v-list-item-title>
                  <v-list-item-subtitle>
                    {{ serv.description }}
                  </v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </div>
        </div>

        <!-- NO HAY RESULTADOS -->
        <div v-else class="text-center text-subtitle-2 mt-4" style="color: #999;">
          No se encontraron servicios
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: "Header",
  data: () => ({
    menu: false,
    searchOpen: false,      // Controla el diálogo
    searchTerm: "",         // Texto de búsqueda
    services: [
      {
        id: 1,
        category: 'barberia',
        title: 'Corte de Cabello',
        description: 'Renueva tu estilo con cortes de cabello modernos',
        image: 'https://i.pinimg.com/236x/4e/58/1c/4e581c07ad20f46ff814bfecfd801623.jpg',
        price: '$18.000',
      },
      {
        id: 2,
        category: 'barberia',
        title: 'Barba',
        description: 'Mantén tu barba perfectamente recortada y cuidada',
        image: 'https://i.pinimg.com/236x/18/47/73/184773a42d076fb4a4e610f626851c41.jpg',
        price: '$18.000',
      },
      {
        id: 3,
        category: 'barberia',
        title: 'Barba + Corte',
        description: 'Combo de corte de cabello y arreglo de barba',
        image: 'https://i.pinimg.com/236x/19/b7/b5/19b7b5f479d6b3ce137c90ca535f4e40.jpg',
        price: '$18.000',
      },
      {
        id: 4,
        category: 'lociones',
        title: 'Locion CH',
        description: 'Fragancia para hombres y mujeres',
        image: 'https://i.pinimg.com/236x/57/b6/96/57b69658bff2ed8d4159918d092dc776.jpg',
        price: '$18.000',
      },
      {
        id: 5,
        category: 'lociones',
        title: 'Locion LaCoste',
        description: 'Fragancia para hombre',
        image: 'https://i.pinimg.com/236x/b4/f9/7e/b4f97e8362dc90b2befb728c990f4016.jpg',
        price: '$18.000',
      },
      {
        id: 6,
        category: 'barberia',
        title: 'cejas',
        description: 'Mantén tus cejas perfectamente recortadas y cuidadas',
        image: 'https://i.pinimg.com/236x/59/cf/be/59cfbed2dfde3832753847463db39401.jpg',
        price: '$18.000',
      },
      {
        id: 7,
        category: 'barberia',
        title: 'Mascarilla y corte',
        description: 'Mascarilla y corte de cabello',
        image: 'https://i.pinimg.com/236x/16/68/fe/1668fed37e41be971c7fa5b81398223d.jpg',
        price: '$18.000',
      },
      {
        id: 8,
        category: 'cuidado',
        title: 'Cera para cabello',
        description: 'Productos de calidad para tu cabello',
        image: 'https://i.pinimg.com/236x/0a/a4/f4/0aa4f4e283db499aa26d195dba5af55d.jpg',
        price: '$18.000',
      },
      {
        id: 9,
        category: 'cuidado',
        title: 'Shampoo',
        description: 'Shampoo para el cuidado de tu cabello',
        image: 'https://i.pinimg.com/236x/d9/d9/67/d9d967f90832c8be92a30033afcdbc41.jpg',
        price: '$18.000',
      },
      {
        id: 10,
        category: 'cuidado',
        title: 'Minoxidil',
        description: 'Recupera tu cabello con productos de calidad',
        image: 'https://i.pinimg.com/236x/bf/fd/a1/bffda1717f1b8bd7cecb05847f9092b4.jpg',
        price: '$18.000',
      }
    ]
  }),
  computed: {
    /**
     * Filtra los servicios según el texto en searchTerm
     */
    filteredServices() {
      if (!this.searchTerm.trim()) {
        return this.services
      }
      const term = this.searchTerm.toLowerCase()
      return this.services.filter((serv) =>
        serv.title.toLowerCase().includes(term) ||
        serv.description.toLowerCase().includes(term) ||
        serv.category.toLowerCase().includes(term)
      )
    },

    /**
     * Agrupa los servicios filtrados por categoría
     * Ej. { Barbería: [...], Estilismo: [...], Belleza: [...] }
     */
    groupedResults() {
      const grouped = {}
      this.filteredServices.forEach((service) => {
        const cat = service.category
        if (!grouped[cat]) {
          grouped[cat] = []
        }
        grouped[cat].push(service)
      })
      return grouped
    }
  },
  methods: {
    toggleSearchDialog() {
      this.searchOpen = !this.searchOpen
      // Limpia la búsqueda si lo deseas al abrir
      // this.searchTerm = ""
    },
    formatPrice(price) {
      return new Intl.NumberFormat('es-CL', {
        style: 'currency',
        currency: 'CLP'
      }).format(price)
    },
  }
}
</script>

<style scoped>
.v-app-bar {
  position: static !important;
}

.service-badge {
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
</style>
