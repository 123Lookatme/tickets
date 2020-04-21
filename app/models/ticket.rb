# frozen_string_literal: true

# Ticket model
class Ticket < ApplicationRecord
  has_one :excavator
  has_one :primary_service_area, class_name: 'ServiceArea::Primary'
  has_many :additional_service_areas, class_name: 'ServiceArea::Additional'

  enum request_type: { 'Normal' => 0 }

  scope :with_full_info, lambda {
    includes(
      :excavator,
      primary_service_area: :area_code,
      additional_service_areas: :area_code
    )
  }

  validates :request_number, :sequence_number, :well_known_text, :response_due_date_time,
            presence: true
  validates_datetime :response_due_date_time
end

# == Schema Information
#
# Table name: tickets
#
#  id                     :bigint           not null, primary key
#  request_number         :string
#  request_type           :integer          default("Normal")
#  response_due_date_time :datetime
#  sequence_number        :integer
#  well_known_text        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_tickets_on_request_number  (request_number) UNIQUE
#
