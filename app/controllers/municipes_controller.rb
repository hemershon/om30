class MunicipesController < ApplicationController
  def index
    @municipes = Municipe.all
  end

  def show
    @municipe = Municipe.find(params[:id])
  end

  def new
    @municipe = Municipe.new
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if @municipe.save
      # Envio de email e SMS aqui
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
      # Envio de email e SMS aqui
      redirect_to @municipe, notice: 'Munícipe atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(:nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status)
  end
end
