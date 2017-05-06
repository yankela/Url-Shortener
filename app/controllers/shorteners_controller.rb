class ShortenersController < ApplicationController
  before_action :set_shortener, only: [:show, :edit, :update, :destroy]

  # GET /shorteners
  # GET /shorteners.json
  def index
    @shorteners = Shortener.all
  end

  # GET /shorteners/1
  # GET /shorteners/1.json
  def show
    @shortener = Shortener.find(params[:id])
    redirect_to @shortener.original_url
  end

  # GET /shorteners/new
  def new
    @shortener = Shortener.new
  end

  # GET /shorteners/1/edit
  def edit
  end

  # POST /shorteners
  # POST /shorteners.json
  def create
    @shortener = Shortener.new(shortener_params)

    respond_to do |format|
      if @shortener.save
        # redirect_to shorteners_url
        format.html { redirect_to shorteners_path, notice: 'Shortener was successfully created.' }
        # format.json { render :index, status: :created, location: @shortener }
      else
        format.html { render :new }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorteners/1
  # PATCH/PUT /shorteners/1.json
  def update
    respond_to do |format|
      if @shortener.update(shortener_params)
        format.html { redirect_to @shortener, notice: 'Shortener was successfully updated.' }
        format.json { render :show, status: :ok, location: @shortener }
      else
        format.html { render :edit }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorteners/1
  # DELETE /shorteners/1.json
  def destroy
    @shortener.destroy
    respond_to do |format|
      format.html { redirect_to shorteners_url, notice: 'Shortener was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortener
      @shortener = Shortener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortener_params
      params.require(:shortener).permit(:original_url, :shortened_url)
    end
end
