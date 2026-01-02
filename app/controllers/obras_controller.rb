class ObrasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_obra, only: %i[show edit update]

  def index
    load_obras.ordered
  end

  def show; 
end

  def new
    @obra = Obra.new
  end

  def create
    @obra = Obra.new(obra_params)
    @obra.created_by_id = current_user.id

    if @obra.save
      redirect_to obras_path, notice: "Obra criada com sucesso!"
    else
      @obras = Obra.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @obra.updated_by = current_user.id

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

  def load_obras
    @obras = Obra.where(created_by_id: current_user, deleted_at: nil)
  end
end
