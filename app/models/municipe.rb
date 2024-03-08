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
  has_one_attached :foto
  has_one :endereco

  accepts_nested_attributes_for :endereco

  validates :cpf, presence: true, format: { with: /\A\d{11}\z/, message: "CPF inválido" }
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :cns, presence: true, uniqueness: true, format: { with: /\A\d{15}\z/, message: "formato inválido" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato inválido" }
  validates :cns, presence: true
  validates :email, presence: true
  validates :data_nascimento, presence: true

  validate :data_nascimento_valida?

  private

  def data_nascimento_valida?
    errors.add(:data_nascimento, 'Data de nascimento inválida') unless data_nascimento_valida?
  end

  def data_nascimento_valida?
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
