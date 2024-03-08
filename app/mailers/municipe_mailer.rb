class MunicipeMailer < ApplicationMailer
  def cadastro_confirmado(municipe)
    mail(to: municipe.email, subject: 'Cadastro Confirmado') do |format|
      format.text { render plain: 'Seu cadastro foi confirmado.' }
    end
  end
end
