module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound
    #  обрабатывает ошибку с названием ActiveRecord::RecordNotFound в методе с названием notfound

    private
    def notfound(exception)
      logger.warn exception
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end