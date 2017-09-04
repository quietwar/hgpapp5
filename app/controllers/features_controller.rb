class FeaturesController < ApplicationController

  def index
    @features = Feature.all
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)
  end

  def destroy

  end

  private

  def feature_params
    params.require(:feature).permit(:feature_id)
  end
end
