# frozen_string_literal: true

# Nested Excavator form object
class ContractForm::ExcavatorForm < ApplicationForm
  attr_accessor :company_name, :address, :city, :state, :zip, :crew_onsite

  validates :company_name, :address, :city, :state, :zip, presence: true

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end