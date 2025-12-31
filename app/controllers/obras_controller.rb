class ObrasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_obra, only: %i[show edit update]

  def index
    @obras = Obra.all
  end

  def show; end

  def new
    @obra = Obra.new
  end

  def create
    @obra = Obra.new(obra_params)
    @obra.created_by = current_user

    if @obra.save
      redirect_to @obra
    else
      render :new
    end
  end

  def edit; end

  def update
    @obra.updated_by = current_user

    if @obra.update(obra_params)
      redirect_to @obra
    else
      render :edit
    end
  end

  private

  def set_obra
    @obra = Obra.find(params[:id])
  end

  def obra_params
    params.require(:obra).permit(:nome, :endereco, :progresso)
  end
end
