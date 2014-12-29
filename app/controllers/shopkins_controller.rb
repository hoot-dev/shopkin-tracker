class ShopkinsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /shopkins
  # GET /shopkins.json
  def index
    @shopkins = Shopkin.order(sort_column + ' ' + sort_direction).page(params[:page]).per(10)
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

    def sort_column
      Shopkin.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ?  params[:direction] : 'asc'
    end
end
