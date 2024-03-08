# == Schema Information
#
# Table name: municipes
#
#  id              :bigint           not null, primary key
#  cns             :string
#  cpf             :string
#  data_nascimento :date
#  email           :string
#  fotos           :json
#  nome_completo   :string
#  status          :boolean
#  telefone        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Municipe < ApplicationRecord
  has_many_attached :fotos
  has_one :endereco

  accepts_nested_attributes_for :endereco

  validates :cpf, presence: true, format: { with: /\A\d{11}\z/, message: "CPF inválido" }
  validates :cns, presence: true
  validates :email, presence: true
  validates :data_nascimento, presence: true

  validate :data_nascimento_valida?

  private

  def data_nascimento_valida?
    errors.add(:data_nascimento, 'Data de nascimento inválida') unless data_nascimento_valido?
  end

  def data_nascimento_valido?
    return false if data_nascimento.nil?

    begin
      hoje = Date.today
      data = data_nascimento

      return data <= hoje && data.year > 1900 && data.month.between?(1, 12) && data.day.between?(1, Date.new(data.year, data.month, -1).day)
    rescue ArgumentError
      return false
    end
  end
end
