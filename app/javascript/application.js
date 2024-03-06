// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener('DOMContentLoaded', function() {
  const cepInput = document.getElementById('cep_input');
  const enderecoFields = document.getElementById('endereco_fields');

  cepInput.addEventListener('blur', function() {
    fetch('https://viacep.com.br/ws/' + cepInput.value + '/json/')
      .then(response => response.json())
      .then(data => {
        enderecoFields.style.display = 'block';
        form.rua.value = data.logradouro;
        form.cidade.value = data.localidade;
        form.estado.value = data.uf;
      })
      .catch(error => {
        console.error('Erro ao buscar CEP:', error);
      });
  });
});
