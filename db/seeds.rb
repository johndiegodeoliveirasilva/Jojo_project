require 'net/http'
# Estado
Person.destroy_all
Cidade.destroy_all
Estado.destroy_all
uf_cidades_url = URI('https://gist.githubusercontent.com/letanure/3012978/raw/2e43be5f86eef95b915c1c804ccc86dc9790a50a/estados-cidades.json')
estados_cidades = JSON.parse(Net::HTTP.get(uf_cidades_url))

estados_cidades['estados'].each do |estado|
  uf = Estado.create(sigla: estado['sigla'], nome: estado['nome'])
  p "=========================== #{uf.sigla} - #{uf.nome} =================================="
  estado['cidades'].each do |cidade|
    c = Cidade.create(estado: uf, nome: cidade)
    p "=== Criada a cidade #{c.nome}"
  end
end
p "Estados e Cidades carregados com sucesso!"

1000.times do |t|
  Person.create(name: Faker::Name.name, 
                age: Faker::Number.within(range: 1..90),
                email: Faker::Internet.email,
                cidade_id: Random.rand(Cidade.first.id..Cidade.last.id))
end

p "Pessoas carregados com sucesso!"