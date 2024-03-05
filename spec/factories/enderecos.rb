FactoryBot.define do
  factory :endereco do
    municipe { nil }
    cep { "MyString" }
    logradouro { "MyString" }
    complemento { "MyString" }
    bairro { "MyString" }
    cidade { "MyString" }
    uf { "MyString" }
    codigo_ibge { "MyString" }
  end
end
