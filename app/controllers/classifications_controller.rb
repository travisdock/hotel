class ClassificationsController < ApplicationController
  before_action :set_classification, only: %i[ show edit update destroy ]

  # GET /classifications
  def index
    @classifications = Classification.all
  end

  # GET /classifications/1
  def show
  end

  # GET /classifications/new
  def new
    @classification = Classification.new
  end

  # GET /classifications/1/edit
  def edit
  end

  # POST /classifications
  def create
    @classification = Classification.new(classification_params)

    if @classification.save
      redirect_to @classification, notice: "Classification was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classifications/1
  def update
    if @classification.update(classification_params)
      redirect_to @classification, notice: "Classification was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /classifications/1
  def destroy
    @classification.destroy
    redirect_to classifications_url, notice: "Classification was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      @classification = Classification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classification_params
      params.require(:classification).permit(:name)
    end
end
