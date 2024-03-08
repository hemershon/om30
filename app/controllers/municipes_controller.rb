class MunicipesController < ApplicationController
  def index
    @municipes = Municipe.includes(:endereco).all
  end

  def show
    @municipe = Municipe.find(params[:id])
  end

  def new
    @municipe = Municipe.new
    @municipe.build_endereco
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if @municipe.save
      send_email(@municipe)
      send_sms(@municipe)
      redirect_to @municipe, notice: 'Munícipe criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @municipe = Municipe.find(params[:id])
  end

  def update
    @municipe = Municipe.find(params[:id])
    if @municipe.update(municipe_params)
      send_email(@municipe)
      send_sms(@municipe)

      redirect_to @municipe, notice: 'Munícipe atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def send_email(municipe)
    MunicipeMailer.cadastro_confirmado(municipe).delivery_now
  end

  def send_sms(municipe)
  client = Twilio::REST::Client.new(Rails.application.config.twilio_account_sid, Rails.application.config.twilio_auth_token)
  client.messages.create(
    from: '86999263314',
    to: municipe.telefone,
    body: 'Seu SMS de confirmação aqui'
  )
  end

  def municipe_params
    params.require(:municipe).permit(:nome_completo, :cpf, :cns, :email, 
      :data_nascimento, :telefone, :status, endereco_attributes: [:cep,
      :bairro, :cidade, :codigo_ibge, :complemento, :logradouro, :uf], fotos: [])
  end
end
