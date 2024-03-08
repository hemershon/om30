# == Schema Information
#
# Table name: enderecos
#
#  id          :bigint           not null, primary key
#  bairro      :string
#  cep         :string
#  cidade      :string
#  codigo_ibge :string
#  complemento :string
#  logradouro  :string
#  uf          :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  municipe_id :bigint           not null
#
# Indexes
#
#  index_enderecos_on_municipe_id  (municipe_id)
#
# Foreign Keys
#
#  fk_rails_8abd9faee9  (municipe_id => municipes.id)
#
class Endereco < ApplicationRecord
  belongs_to :municipe

  validates :logradouro, presence: true
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :uf, presence: true
  validates :cep, presence: true
end
