class ValueTypesController < ApplicationController
  before_action :set_value_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /value_types
  def index
    @value_types = ValueType.all
  end

  # GET /value_types/1
  def show
  end

  # GET /value_types/new
  def new
    @value_type = ValueType.new
  end

  # GET /value_types/1/edit
  def edit
  end

  # POST /value_types
  def create
    @value_type = ValueType.new(value_type_params)

    if @value_type.save
      redirect_to @value_type, notice: 'Value type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /value_types/1
  def update
    if @value_type.update(value_type_params)
      redirect_to @value_type, notice: 'Value type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /value_types/1
  def destroy
    @value_type.destroy
    redirect_to value_types_url, notice: 'Value type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_type
      @value_type = ValueType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def value_type_params
      params.require(:value_type).permit(:name, :cumulative, :description)
    end
end
