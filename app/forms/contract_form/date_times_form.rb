# frozen_string_literal: true

# Nested DateTimes form object
class ContractForm::DateTimesForm < ApplicationForm
  attr_accessor :response_due_date_time

  validates :response_due_date_time, presence: true
  validates :response_due_date_time,
            timeliness: { after: -> { Time.zone.now }, type: :date_time }
end