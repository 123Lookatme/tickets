# frozen_string_literal: true

# base Presenter
class ApplicationPresenter < SimpleDelegator
  attr_reader :model, :context
  delegate_missing_to :model

  def initialize(model, view)
    @model = model
    @context = view
    super(@model)
  end
end