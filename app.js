
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
    const radius = 325; // Raio da órbita exato (solicitação user)
    let rot = 0;

    // Função para atualizar posições 3D dos boxes
    function updateCarousel(instant = false) {
        items.forEach((item, index) => {
            const angle = ((index / totalItems) * 360 + rot) % 360;
            const radians = (angle * Math.PI) / 180;

            const x = Math.sin(radians) * radius;
            const z = Math.cos(radians) * radius;

            const tilt = (x / radius) * 15;
            const scale = (z + radius) / (radius * 2) * 0.35 + 0.65;

            const animationProps = {
                x: x,
                z: z,
                scale: scale,
                rotationY: -tilt,
                opacity: 1,
                zIndex: Math.round(z + radius)
            };

            if (instant) {
                gsap.set(item, animationProps);
            } else {
                gsap.to(item, {
                    ...animationProps,
                    duration: 0.8,
                    ease: "power2.out"
                });
            }

            if (index === 0) {
                const orbitX = (Math.sin(radians) * 50) + 50;
                gsap.to("#orbit-dot", { left: `${orbitX}%`, duration: instant ? 0 : 0.8 });
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
            rot -= 0.35; // Rotação ligeiramente mais rápida para dinamismo
            updateCarousel();
        }
    }, 25); // Intervalo menor para maior fluidez

    const scene = document.querySelector('.carousel-item')?.parentElement;
    if (scene) {
        scene.addEventListener('mouseenter', () => isHoveringCarousel = true);
        scene.addEventListener('mouseleave', () => isHoveringCarousel = false);
    }

    updateCarousel(true); // Inicialização Instantânea



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

    // 6. Section Progress Indicator
    const serviceSections = document.querySelectorAll('main > div > div[class*="flex"]');
    const indicatorContainer = document.querySelector('.section-indicator');

    if (indicatorContainer && serviceSections.length) {
        serviceSections.forEach((_, i) => {
            const dot = document.createElement('div');
            dot.className = 'indicator-dot';
            if (i === 0) dot.classList.add('active');
            indicatorContainer.appendChild(dot);
        });

        window.addEventListener('scroll', () => {
            let current = 0;
            serviceSections.forEach((section, i) => {
                const sectionTop = section.offsetTop;
                if (window.pageYOffset >= sectionTop - 400) {
                    current = i;
                }
            });

            const dots = document.querySelectorAll('.indicator-dot');
            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === current);
            });
        });
    }

    // 7. Cursor Spotlight Effect
    const spotlight = document.querySelector('.spotlight');
    if (spotlight) {
        document.addEventListener('mousemove', (e) => {
            gsap.to(spotlight, {
                x: e.clientX,
                y: e.clientY,
                duration: 0.8,
                ease: 'power2.out'
            });
            spotlight.style.opacity = "1";
        });
    }

    // 8. Staggered Card Entrance (Optimizado para Performance)
    const cards = document.querySelectorAll('.glass-card:not(.static-card)');
    cards.forEach((card) => {
        gsap.from(card, {
            scrollTrigger: {
                trigger: card,
                start: "top 95%",
                toggleActions: "play none none reverse"
            },
            y: 30,
            opacity: 0,
            duration: 0.8,
            ease: "power2.out"
        });
    });

    // 9. Scroll Progress Bar
    const progressBar = document.querySelector('.scroll-progress');
    if (progressBar) {
        window.addEventListener('scroll', () => {
            const h = document.documentElement,
                b = document.body,
                st = 'scrollTop',
                sh = 'scrollHeight';
            const percent = (h[st] || b[st]) / ((h[sh] || b[sh]) - h.clientHeight) * 100;
            progressBar.style.transform = `scaleX(${percent / 100})`;
        });
    }
});