namespace :utils do
  desc "TODO"
  task setup_municipies: :environment do
    10.times do
      municipe = Municipe.create(
        nome_completo: Faker::Name.name,
        cpf: Faker::CPF.pretty,
        cns: Faker::Number.number(digits: 15),
        email: Faker::Internet.email,
        data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 90),
        status: [true, false].sample
      )
      municipe.create_endereco(
        rua: Faker::Address.street_name,
        cidade: Faker::Address.city,
        estado: Faker::Address.state_abbr
      )
    end
    puts 'Dados fictícios gerados com sucesso.'
  end
end
