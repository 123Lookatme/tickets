# frozen_string_literal: true

# Errors interceptor
module ErrorsInterceptor
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActiveModel::ValidationError, with: :validation_error
    rescue_from ActiveRecord::RecordNotFound, with: :active_record_not_found
  end

  def unprocessable_entity(exception)
    render_errors(
      errors: exception.record.errors.as_json(full_messages: true),
      status: :unprocessable_entity
    )
  end

  def validation_error(exception)
    render_errors(
      errors: exception.model.errors.as_json(full_messages: true),
      status: :unprocessable_entity
    )
  end

  def not_found(exception)
    render_errors errors: exception.message, status: :not_found
  end

  def active_record_not_found(exception)
    render_errors errors: "#{exception.model.titleize} not found", status: :not_found
  end

  def bad_request(message)
    render_errors errors: message, status: :bad_request
  end

  def render_errors(errors:, status:)
    render json: { errors: errors }, status: status
  end
end
