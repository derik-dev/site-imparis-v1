$content = Get-Content -Path servicos.html -Raw
$headPos = $content.IndexOf("</nav>") + "</nav>".Length
$tailPos = $content.IndexOf("<section id=""contato""")

if ($headPos -gt 0 -and $tailPos -gt 0) {
    $head = $content.Substring(0, $headPos)
    $tail = $content.Substring($tailPos)

    $body = @"
<main class="pt-40 lg:pt-48 pb-24 relative bg-black min-h-screen">
    <!-- Luzes de Fundo -->
    <div class="absolute top-0 right-0 w-[800px] h-[800px] bg-brand-500/10 blur-[200px] rounded-full pointer-events-none z-0"></div>

    <div class="max-w-7xl mx-auto px-6 relative z-10 text-center mb-32">
        <span class="text-sm font-black uppercase tracking-[0.3em] text-brand-500 mb-4 block animate-fade-in">Mosaico Imparis</span>
        <h1 class="text-6xl md:text-8xl font-black text-white tracking-tighter mb-8 max-w-4xl mx-auto font-jakarta">
            Nossas <span class="text-transparent bg-clip-text bg-gradient-to-r from-brand-500 to-accent-500 italic">Soluções.</span>
        </h1>
        <p class="text-zinc-400 text-lg md:text-xl font-medium max-w-3xl mx-auto leading-relaxed">
            Desde a fundação à expansão global. Mergulhamos no seu modelo de negócio para desenhar e executar estratégias digitais, presenciais e tecnológicas focadas apenas numa métrica: Resultados agressivos.
        </p>
    </div>

    <!-- Lista Detalhada de Serviços -->
    <div class="max-w-5xl mx-auto px-6 space-y-8 relative z-10">
        
        <!-- SITE -->
        <div class="bg-zinc-900/60 backdrop-blur-md border border-white/5 rounded-[3rem] p-10 md:p-14 flex flex-col md:flex-row gap-10 items-center hover:border-brand-500/30 transition-all duration-500 group shadow-2xl relative overflow-hidden">
            <div class="absolute right-0 top-0 w-64 h-64 bg-brand-500/5 blur-[80px] rounded-full transition-all group-hover:bg-brand-500/10"></div>
            <div class="w-24 h-24 shrink-0 bg-zinc-950 border border-brand-500/20 rounded-[2rem] flex items-center justify-center text-brand-500 shadow-[0_0_30px_rgba(15,76,146,0.3)] group-hover:scale-110 transition-transform duration-500 z-10">
                <i class="ph-bold ph-layout text-4xl"></i>
            </div>
            <div class="z-10 relative">
                <h3 class="text-3xl lg:text-4xl font-black text-white mb-4 uppercase tracking-tighter">Sites & E-Commerce</h3>
                <p class="text-zinc-400 text-lg font-medium leading-relaxed mb-6">Desenhamos sites estratégicos que captam a essência absoluta do seu negócio e agem como as melhores ferramentas de vendas. Recusamos templates genéricos — aqui tudo é desenvolvido do zero, à mão, focado na sua taxa de conversão.</p>
                <div class="flex flex-wrap gap-2">
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-black uppercase tracking-widest">UX/UI Design</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">Performance</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-brand-500 font-bold uppercase tracking-widest bg-brand-500/5 border-brand-500/20">Sem Templates</span>
                </div>
            </div>
        </div>

        <!-- APP & CRM -->
        <div class="bg-zinc-900/60 backdrop-blur-md border border-white/5 rounded-[3rem] p-10 md:p-14 flex flex-col md:flex-row gap-10 items-center hover:border-brand-500/30 transition-all duration-500 group shadow-2xl relative overflow-hidden">
            <div class="absolute right-0 top-0 w-64 h-64 bg-brand-500/5 blur-[80px] rounded-full transition-all group-hover:bg-brand-500/10"></div>
            <div class="w-24 h-24 shrink-0 bg-zinc-950 border border-brand-500/20 rounded-[2rem] flex items-center justify-center text-brand-500 shadow-[0_0_30px_rgba(15,76,146,0.3)] group-hover:scale-110 transition-transform duration-500 z-10">
                <i class="ph-bold ph-device-mobile text-4xl"></i>
            </div>
            <div class="z-10 relative">
                <h3 class="text-3xl lg:text-4xl font-black text-white mb-4 uppercase tracking-tighter">Aplicativos & Software</h3>
                <p class="text-zinc-400 text-lg font-medium leading-relaxed mb-6">Retenha seus clientes na palma da mão e controle os seus processos através de tecnologia nativa. De Apps corporativas a sistemas robustos de CRM.</p>
            </div>
        </div>

        <!-- DESIGN & REDES SOCIAIS -->
        <div class="bg-zinc-900/60 backdrop-blur-md border border-white/5 rounded-[3rem] p-10 md:p-14 flex flex-col md:flex-row gap-10 items-center hover:border-brand-500/30 transition-all duration-500 group shadow-2xl relative overflow-hidden">
            <div class="absolute right-0 top-0 w-64 h-64 bg-brand-500/5 blur-[80px] rounded-full transition-all group-hover:bg-brand-500/10"></div>
            <div class="w-24 h-24 shrink-0 bg-zinc-950 border border-brand-500/20 rounded-[2rem] flex items-center justify-center text-brand-500 shadow-[0_0_30px_rgba(15,76,146,0.3)] group-hover:scale-110 transition-transform duration-500 z-10">
                <i class="ph-bold ph-pen-nib text-4xl"></i>
            </div>
            <div class="z-10 relative">
                <h3 class="text-3xl lg:text-4xl font-black text-white mb-4 uppercase tracking-tighter">Design & Redes Sociais</h3>
                <p class="text-zinc-400 text-lg font-medium leading-relaxed mb-6">A identidade visual que constrói impérios. Posicionamos a sua marca artisticamente com gestão estratégica que realmente educa os clientes, cria autoridade massiva e atrai vendas.</p>
            </div>
        </div>

        <!-- TRÁFEGO PAGO -->
        <div class="bg-zinc-900/60 backdrop-blur-md border border-white/5 rounded-[3rem] p-10 md:p-14 flex flex-col md:flex-row gap-10 items-center hover:border-brand-500/30 transition-all duration-500 group shadow-2xl relative overflow-hidden">
            <div class="absolute right-0 top-0 w-64 h-64 bg-brand-500/5 blur-[80px] rounded-full transition-all group-hover:bg-brand-500/10"></div>
            <div class="w-24 h-24 shrink-0 bg-zinc-950 border border-brand-500/20 rounded-[2rem] flex items-center justify-center text-brand-500 shadow-[0_0_30px_rgba(15,76,146,0.3)] group-hover:scale-110 transition-transform duration-500 z-10">
                <i class="ph-bold ph-lightning text-4xl"></i>
            </div>
            <div class="z-10 relative">
                <h3 class="text-3xl lg:text-4xl font-black text-white mb-4 uppercase tracking-tighter">Engenharia de Tráfego</h3>
                <p class="text-zinc-400 text-lg font-medium leading-relaxed mb-6">Aceleração com máxima previsibilidade. Distribuímos a sua solução ativamente nos placares globais, escalando faturamento sem depender do orgânico.</p>
                <div class="flex flex-wrap gap-2">
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">Meta ADS</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">Google / YouTube ADS</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">LinkedIn B2B</span>
                </div>
            </div>
        </div>

        <!-- EVENTOS & LANÇAMENTOS -->
        <div class="bg-zinc-900/60 backdrop-blur-md border border-white/5 rounded-[3rem] p-10 md:p-14 flex flex-col md:flex-row gap-10 items-center hover:border-brand-500/30 transition-all duration-500 group shadow-2xl relative overflow-hidden border-t-2 border-t-brand-500/30">
            <div class="absolute right-0 top-0 w-64 h-64 bg-brand-500/5 blur-[80px] rounded-full transition-all group-hover:bg-brand-500/10"></div>
            <div class="w-24 h-24 shrink-0 bg-brand-500 border border-brand-400 rounded-[2rem] flex items-center justify-center text-zinc-950 shadow-[0_0_40px_rgba(15,76,146,0.6)] group-hover:scale-110 transition-transform duration-500 z-10">
                <i class="ph-bold ph-rocket-launch text-4xl"></i>
            </div>
            <div class="z-10 relative">
                <h3 class="text-3xl lg:text-4xl font-black text-white mb-4 uppercase tracking-tighter">Eventos & Lançamentos</h3>
                <p class="text-zinc-400 text-lg font-medium leading-relaxed mb-6">O seu conhecimento como ponte de negócios. Orquestramos lançamentos de produtos digitais com escalas vertiginosas, e formatamos eventos presenciais de puro status, autoridade e networking VIP.</p>
                <div class="flex flex-wrap gap-2">
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">Masterminds</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-zinc-500 font-bold uppercase tracking-widest">Eventos Híbridos</span>
                    <span class="px-5 py-2 bg-zinc-950 border border-zinc-800 rounded-full text-[10px] text-brand-500 font-bold uppercase tracking-widest bg-brand-500/5 border-brand-500/20">Escala de Infoprodutos</span>
                </div>
            </div>
        </div>

    </div>
</main>
"@

    Set-Content -Path servicos.html -Value ($head + "`n" + $body + "`n" + $tail) -Encoding UTF8
} else {
    Write-Output "Tags not found"
}
