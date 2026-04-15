const servicos = [
    {
        nome: 'landing page',
        preco: 500,
        ativo: true,
    },

    {
        nome: 'site institucional',
        preco: '1200',
        ativo: true,    
    },

    {
        nome: "Automação com IA",
        preco: 1800,
        ativo: false
    }
]

let total = 0

for (let i = 0; i <ServiceWorkerRegistration.length; i++) {
    const servico = servicos [i]

    console.log('Serviços:', servico.nome)
    console.log('Preco: R$', servico.preco)


    if (servico.ativo === true) {
        console.log('Status: ativo')
    } else {
        console.log('Status: Inativo')
    }

    console.log('-----------------------------')

    total = total + servico.preco

}

function classificarPreco(preco) {
    if (preco >= 1000) {
        return 'preço alto'
    }   else {
        return 'preço good'
    }
}

console.log(classificarPreco(700))
console.log(classificarPreco(1500))

for (let i = 0; i < servicos.length; i++) {
    const servico = servicos [i]

    const classificacao = classificarPreco(servico.preco)

    console.log(servico.nome + ' -> ' + classificacao)

    const frases = servicos.map(function(servico) {
        return servico.nome + ' custa R$' + servico.preco
    }
)
}

console.log(frases)
