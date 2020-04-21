# frozen_string_literal: true

module API
  module V1
    # Api base controller
    class ApplicationController < ActionController::API
      include ErrorsInterceptor
    end
  end
end