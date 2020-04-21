# frozen_string_literal: true

# FormObject base class
class ApplicationForm
  include ActiveModel::Model

  class << self
    attr_reader :attributes

    %i[attr_reader attr_accessor].each do |method|
      define_method(method) do |*args|
        @attributes = args
        super(*args)
      end
    end
  end

  def attributes
    self.class.attributes.inject({}) do |h, key|
      h.merge key => public_send(key)
    end
  end

  def submit!
    validate!
    persist!
  end

  private

  def persist!
    false
  end
end