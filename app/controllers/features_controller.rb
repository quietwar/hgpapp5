class FeaturesController < ApplicationController
  def show
    @feature = feature.find(params[:id])

  end

  def create
    feature = User.find(params[:feature_id])
    params[:user_id] = current_user.id

    Feature.create(feature_params)
  end

  def destroy

  end

  private

  def feature_params
    params.require(:feature).permit(:feature_id, :user_id)
  end
end
