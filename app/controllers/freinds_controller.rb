class FreindsController < ApplicationController
  before_action :set_freind, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /freinds
  # GET /freinds.json
  def index
    @freinds = Freind.all
  end

  # GET /freinds/1
  # GET /freinds/1.json
  def show
  end

  # GET /freinds/new
  def new
    # @freind = Freind.new
    @freind = current_user.freinds.build
  end

  # GET /freinds/1/edit
  def edit
  end

  # POST /freinds
  # POST /freinds.json
  def create
    # @freind = Freind.new(freind_params)
    @freind = current_user.freinds.build(freind_params)

    respond_to do |format|
      if @freind.save
        format.html { redirect_to @freind, notice: 'Freind was successfully created.' }
        format.json { render :show, status: :created, location: @freind }
      else
        format.html { render :new }
        format.json { render json: @freind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /freinds/1
  # PATCH/PUT /freinds/1.json
  def update
    respond_to do |format|
      if @freind.update(freind_params)
        format.html { redirect_to @freind, notice: 'Freind was successfully updated.' }
        format.json { render :show, status: :ok, location: @freind }
      else
        format.html { render :edit }
        format.json { render json: @freind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freinds/1
  # DELETE /freinds/1.json
  def destroy
    @freind.destroy
    respond_to do |format|
      format.html { redirect_to freinds_url, notice: 'Freind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def correct_user
  @freind = current_user.freinds.find_by(id: params[ :id])
  redirect_to freinds_path, notice: "Not Authorised to edit this freind" if @freind.nil?
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freind
      @freind = Freind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def freind_params
      params.require(:freind).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
