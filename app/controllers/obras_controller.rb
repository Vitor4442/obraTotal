class ObrasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_obra, only: %i[show update destroy]

  def index
    @obras = Obra.all
  end

  def show
  end

  def create
    @obra = Obra.new(obra_params)
    @obra.created_by_id = current_user.id

    if @obra.save
      render json: @obra, status: :created
    else
      render json: @obra.errors, status: :unprocessable_entity
    end
  end

  def update
    if @obra.update(obra_params.merge(updated_by_id: current_user.id))
      render json: @obra
    else
      render json: @obra.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @obra.update(
      deleted_at: Time.current,
      deleted_by_id: current_user.id
    )
    head :no_content
  end

  private

  def set_obra
    @obra = Obra.find(params[:id])
  end

  def obra_params
    params.require(:obra).permit(:nome, :endereco)
  end
end
