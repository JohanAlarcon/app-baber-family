<template>
    <v-carousel height="200" show-arrows="hover" cycle hide-delimiter-background style="padding: 10px;">
        <v-carousel-item v-for="(slide, i) in slides" :key="i">
            <v-sheet class="position-relative" color="transparent" height="100%" rounded="lg" elevation="2">
                <v-img :src="slide.image" cover height="100%" width="100%" class="bg-surface-variant rounded mx-auto"/>
                <div class="carousel-overlay" style="padding: 10px;" >
                    <h3 class="text-caption font-weight-bold mb-1">
                        {{ slide.title }}
                    </h3>
                    <p class="text-caption mb-2">
                        {{ slide.description }}
                    </p>
                    <div class="text-caption mb-3">{{ slide.price }}</div>
                    <v-col cols="auto">
                        <v-btn :color="buttonColor" rounded="xl" size="x-small" style="color: #fff">Ver más</v-btn>
                    </v-col>

                </div>
            </v-sheet>
        </v-carousel-item>
    </v-carousel>
</template>

<script>
export default {
    name: 'Carousel',
    data() {
        return {
            buttonColor: '#00BCD4',
            slides: [
                {
                    image: 'https://i.pinimg.com/736x/ae/67/7a/ae677a18891ad058e1526f2b087028b6.jpg',
                    title: 'Cortes',
                    description: 'Completa tu look con un peinado profesional',
                    price: '$18.000'
                },
                {
                    image: 'https://i.pinimg.com/474x/bf/0c/e6/bf0ce6542fb5135657e9ff8d550ce528.jpg',
                    title: 'Cortes Modernos',
                    description: 'Mantente a la moda con los últimos estilos',
                    price: '$18.000'
                },
                {
                    image: 'https://i.pinimg.com/236x/79/74/51/7974517ee82ac3a906a2d2c5fcbaee9f.jpg',
                    title: 'Barba + corte',
                    description: 'Cuida tu imagen con servicios de primera',
                    price: '$25.000'
                },
                {
                    image: 'https://i.pinimg.com/236x/5f/85/22/5f8522eee3809107d734ba63ed38db5d.jpg',
                    title: 'Cera para cabello',
                    description: 'Productos de calidad para tu cabello',
                    price: '$30.000'
                },
                {
                    image: 'https://i.pinimg.com/236x/51/50/1a/51501a9930dd4e782d2d95cfb31a0ea2.jpg',
                    title: 'Minoxidil',
                    description: 'Recupera tu cabello con productos de calidad',
                    price: '$42.000'
                },
                {
                    image: 'https://i.pinimg.com/474x/f0/b8/85/f0b885a1c406d28101f1b0150bfb904b.jpg',
                    title: 'Lociones',
                    description: 'Lociones para el cuidado de tu piel',
                    price: '$20.000'
                },
            ],
        }
    },
}
</script>

<style scoped>
.carousel-overlay {
    position: absolute;
    height: 60%;
    top: 20px;
    left: 20px;
    max-width: 280px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 15px;
    color: #fff;
}
</style>