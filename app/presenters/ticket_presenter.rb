# frozen_string_literal: true

# Tickets presenter
class TicketPresenter < ApplicationPresenter
  delegate :company_name, :address, :crew_onsite, to: :excavator, allow_nil: true

  def self.table_fields
    %i[
      id
      request_number
      request_type
      sequence_number
      service_area
      company_name
      address
      crew_onsite
    ]
  end

  def service_area
    ([primary_code] + [additional_codes]).compact.flatten.join(',')
  end

  def url
    context.ticket_path(model)
  end

  def polygon
    well_known_text.scan(/[+-]?\d+.\d+/).map(&:to_f).each_slice(2).to_a
  end

  private

  def primary_code
    return 'None' unless primary_service_area.present?

    primary_service_area.area_code.sa_code
  end

  def additional_codes
    additional_service_areas.map(&:area_code).map(&:sa_code)
  end
end