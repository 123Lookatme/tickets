# frozen_string_literal: true

# Base helper
module ApplicationHelper
  def present(model, presenter: nil)
    klass = presenter || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield presenter if block_given?
  end
end
