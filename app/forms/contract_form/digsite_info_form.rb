# frozen_string_literal: true

# Nested DigSiteInfo form object
class ContractForm::DigsiteInfoForm < ApplicationForm
  attr_accessor :well_known_text

  validates :well_known_text, presence: true
end
