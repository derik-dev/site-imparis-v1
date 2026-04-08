/**
 * Imparis Solutions - Elite Logic System v4.0
 * Orquestrando interatividades dinâmicas e 3D.
 */

document.addEventListener('DOMContentLoaded', () => {
    // 0. Registrar Plugins GSAP
    gsap.registerPlugin(ScrollTrigger);

    // 0.5 Inicializar Lenis (Premium Smooth Scroll)
    const lenis = new Lenis({
        duration: 1.4,
        easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
        direction: 'vertical',
        gestureDirection: 'vertical',
        smooth: true,
        smoothTouch: false,
    });

    lenis.on('scroll', ScrollTrigger.update);

    gsap.ticker.add((time) => {
        lenis.raf(time * 1000);
    });
    gsap.ticker.lagSmoothing(0);

    // 1. CARROSSEL 3D CURVO (Elite Carousel)
    const items = document.querySelectorAll('.carousel-item');
    const totalItems = items.length;
    const radius = 280; // Raio da órbita ideal
    let rot = 0;

    // Função para atualizar posições 3D dos boxes
    function updateCarousel() {
        items.forEach((item, index) => {
            const angle = ((index / totalItems) * 360 + rot) % 360;
            const radians = (angle * Math.PI) / 180;

            const x = Math.sin(radians) * radius;
            const z = Math.cos(radians) * radius;

            // Tilting dinâmico e Escala baseada em profundidade
            const tilt = (x / radius) * 15;
            const scale = (z + radius) / (radius * 2) * 0.35 + 0.65;
            const opacity = (z + radius) / (radius * 2) * 0.7 + 0.3;

            gsap.to(item, {
                duration: 0.8,
                x: x,
                z: z,
                scale: scale,
                rotationY: -tilt,
                opacity: opacity,
                zIndex: Math.round(z + radius),
                ease: "power2.out"
            });

            // Sincroniza o ponto da órbita visual
            if (index === 0) {
                const orbitX = (Math.sin(radians) * 50) + 50;
                gsap.to("#orbit-dot", { left: `${orbitX}%`, duration: 0.8 });
            }
        });
    }

    // Navegação do Carrossel
    const step = 360 / totalItems;
    const nextBtn = document.getElementById('next-btn');
    const prevBtn = document.getElementById('prev-btn');

    if (nextBtn) nextBtn.addEventListener('click', () => {
        rot -= step;
        updateCarousel();
    });

    if (prevBtn) prevBtn.addEventListener('click', () => {
        rot += step;
        updateCarousel();
    });

    // Rotação Automática Suave
    let isHoveringCarousel = false;
    const carouselTimer = setInterval(() => {
        if (!isHoveringCarousel) {
            rot -= 0.25;
            updateCarousel();
        }
    }, 30);

    const scene = document.querySelector('.carousel-item')?.parentElement;
    if (scene) {
        scene.addEventListener('mouseenter', () => isHoveringCarousel = true);
        scene.addEventListener('mouseleave', () => isHoveringCarousel = false);
    }

    updateCarousel(); // Inicialização



    // 4. REVELAÇÃO DE CABEÇALHOS E ELEMENTOS (ScrollTrigger)
    gsap.utils.toArray(".section-header, #experiencia h3, .section-title").forEach(elemento => {
        gsap.from(elemento, {
            opacity: 0,
            y: 40,
            duration: 1.2,
            ease: "power3.out",
            scrollTrigger: {
                trigger: elemento,
                start: "top 90%",
            }
        });
    });
});