class EtiquetasController < ApplicationController
before_action :authenticate_user!
before_action :set_etiqueta, only: %i[show edit update destroy]

def index
  @etiquetas = current_user.etiquetas.order(created_at: :desc)

  if params[:q].present?
    query = params[:q].strip

    # Tenta converter para data DD/MM/YYYY
    begin
      data = Date.strptime(query, "%d/%m/%Y")
      @etiquetas = @etiquetas.where(data_emissao: data)
    rescue ArgumentError
      @etiquetas = @etiquetas.joins(:partes).where("etiquetas.tipo ILIKE :q OR partes.nome ILIKE :q OR partes.cpf ILIKE :q",q: "%#{query}%").distinct
    end
  end
end


  def show
    nomes = @etiqueta.partes.pluck(:nome)
    @etiquetas_para_imprimir = []

    # Quebrar os nomes em grupos de no máximo 3
    grupos_de_nomes = nomes.each_slice(3).to_a

    # Repetir cada grupo conforme quantidade de etiquetas
    grupos_de_nomes.each do |grupo|
      @etiqueta.quantidade.times do
        @etiquetas_para_imprimir << grupo
      end
    end
  end


  def new
    @etiqueta = Etiqueta.new
    @etiqueta.partes.build if @etiqueta.partes.empty?
  end


  def create
    @etiqueta = current_user.etiquetas.new(etiqueta_params)
    if @etiqueta.save
      redirect_to @etiqueta, notice: "Etiqueta criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  @etiqueta = Etiqueta.find(params[:id])
  @etiqueta.partes.build if @etiqueta.partes.empty?
  end


  def update
    if @etiqueta.update(etiqueta_params)
      redirect_to @etiqueta, notice: "Etiqueta atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @etiqueta.destroy
    redirect_to etiquetas_path, notice: "Etiqueta excluída."
  end

  private

  def set_etiqueta
    @etiqueta = current_user.etiquetas.find(params[:id])
  end

  def etiqueta_params
    params.require(:etiqueta).permit(:data_emissao, :tipo, :quantidade, :isento,partes_attributes: [:id, :nome, :cpf, :_destroy])
  end
end
