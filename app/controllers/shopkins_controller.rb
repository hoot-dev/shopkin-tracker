class ShopkinsController < ApplicationController
  # GET /shopkins
  # GET /shopkins.json
  def index
    @shopkins = Shopkin.all
  end

  # GET /shopkins/1
  # GET /shopkins/1.json
  def show
    @shopkin = Shopkin.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shopkin_params
      params.require(:shopkin).permit(:name, :rating, :rarity, :series, :team)
    end
end
