# == Schema Information
#
# Table name: municipes
#
#  id              :bigint           not null, primary key
#  cns             :string
#  cpf             :string
#  data_nascimento :date
#  email           :string
#  foto            :string
#  nome_completo   :string
#  status          :boolean
#  telefone        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Municipe < ApplicationRecord
  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :data_nascimento, presence: true
  validates :nome_completo, presence: true

  validate :data_nascimento_valida?

  private

  def data_nascimento_valida?
    errors.add(:data_nascimento, 'Data de nascimento inválida') unless data_nascimento_valida?
  end

  def data_nascimento_valida?
    return false if data_nascimento.nil?

    begin
      data = Date.strptime(data_nascimento, '%d/%m/%y')
      hoje = Date.today

      return data <= hoje && data.year > 1900 && data.month.between?(1, 12) && data.day.between?(1, Date.new(data.year, data.month, -1).day)
    rescue ArgumentError
      return false
    end
  end
end
