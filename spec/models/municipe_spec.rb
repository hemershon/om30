require 'rails_helper'

RSpec.describe Municipe, type: :model do
  
  context 'data de nascimento' do 
    it 'é válida' do
      municipe = Municipe.new(data_nascimento: '30/04/1990')
      expect(municipe).to be_valid
    end

    it 'não pode estar no futuro' do
      municipe = Municipe.new(data_nascimento: Date.today + 1)
      expect(pessoa).not_to be_valid
    end

    it 'não pode ter ano negativo' do 
      municipe = Municipe.new(data_nascimento: '30/04/-1990')
      expect(municipe).not_to be_valid
    end

    it 'deve ter mês valido' do 
      municipe = Municipe.new(data_nascimento: '30/13/1990')
      expect(municipe).not_to be_valid
    end
  end
end
