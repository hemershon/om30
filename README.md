## Projeto CRUD de Municípes em Ruby on Rails 7

Este projeto é um exemplo de um CRUD de Munícipes desenvolvido em Ruby on Rails 7, utilizando um banco de dados PostgreSQL. O objetivo é mostrar como criar operações básicas de criação, leitura, atualização de registros de munícipes, incluindo validações de CPF e data de nascimento.

### Funcionalidades

- **Listagem de Munícipes:** Exibe uma lista de todos os munícipes cadastrados.
- **Cadastro de Munícipe:** Permite cadastrar um novo munícipe, incluindo nome completo, CPF, CNS, e-mail, data de nascimento, telefone, foto e status.
- **Cadastro de Endereço:** Permite cadastrar o endereço do munícipe, incluindo CEP, logradouro, complemento, bairro, cidade, UF e código IBGE.

### Validações

- Todos os campos de munícipe são obrigatórios.
- O CPF, CNS e e-mail devem ser válidos.
- A data de nascimento não pode ser futura.
- Todos os campos de endereço são obrigatórios, exceto complemento e código IBGE.

### Tecnologias Utilizadas

- Ruby 3.3.0
- Ruby on Rails 7
- PostgreSQL

### Execução do Projeto

Para executar o projeto, siga os passos abaixo:

1. Instale as dependências do projeto:

   ```bash
   bundle install
   ```

2. Crie o banco de dados e execute as migrações:

   ```bash
   rails db:create
   rails db:migrate
   ```

3. Inicie o servidor Rails:

   ```bash
   rails server
   ```

4. Acesse o projeto em [http://localhost:3000](http://localhost:3000).

### Observações

- O projeto foi desenvolvido com foco em qualidade, seguindo os princípios e padrões de projetos.
- Foram utilizadas validações e tratamentos de erro para garantir a integridade dos dados e a boa experiência do usuário.
- O código foi estruturado de forma a reduzir o número de chamadas ao banco de dados, visando a otimização e performance da aplicação.

Este projeto é apenas um exemplo e pode ser modificado e expandido de acordo com as necessidades específicas do seu projeto.