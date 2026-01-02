class ObrasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_obra, only: %i[show edit update]

  def index
    @obras = load_obras.ordered
  end

  def show; 
end

  def new
    @obra = Obra.new
  end

  def create
    @obra = Obra.new(obra_params)
    @obra.created_by_id = current_user.id
    @obra.progresso = 0
  if @obra.save
    redirect_to obras_path, notice: "Obra criada!", status: :see_other
else
    render :new, status: :unprocessable_entity
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

 def destroy
  @obra = Obra.find(params[:id])

  @obra.update!(
    deleted_at: Time.current,
    deleted_by_id: current_user.id
  )

  redirect_to obras_path,
              notice: "Obra excluída com sucesso!",
              status: :see_other
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
