class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all

  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    @categories = Category.pluck(:title)
    @tags = Tag.all
  end

  # GET /ads/1/edit
  def edit

  end

  # POST /ads
  # POST /ads.json
  def create
  @ad = Ad.new(ad_params)

  params[:ad][:ads_tags].each do |id, value|
    @ad.tags.push Tag.find(id) if value == '1'


  end

  respond_to do |format|
    if @ad.save
      format.html { redirect_to @ad, notice: 'Music was successfully created.' }
      format.json { render :show, status: :created, location: @ad }
    else
      format.html { render :new }
      format.json { render json: @ad.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @ad.update(ad_params)
      redirect_to root_path
    else
    redirect_to root_path
    end
  end
end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def ad_params
        params.require(:ad).permit(:title, :category, :tag)
    end

    # Only allow a list of trusted parameters through.

end
