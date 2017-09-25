class ErrorObserver < Everett::Observer
  def after_create(error)
    Rails.logger.info('New error!')
  end
end
