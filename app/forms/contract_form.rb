# frozen_string_literal: true

# Top level form object
class ContractForm < ApplicationForm
  attr_accessor :digsite_info, :date_times, :service_area, :ticket, :excavator

  delegate :attributes=, to: :digsite_info, prefix: true
  delegate :attributes=, to: :date_times, prefix: true
  delegate :attributes=, to: :service_area, prefix: true
  delegate :attributes=, to: :ticket, prefix: true
  delegate :attributes=, to: :excavator, prefix: true

  validate :nested_forms_validation

  def initialize(params = {})
    @digsite_info = DigsiteInfoForm.new
    @date_times = DateTimesForm.new
    @service_area = ServiceAreaForm.new
    @ticket = TicketForm.new
    @excavator = ExcavatorForm.new
    super
  end

  ##### Models #####

  def primary_service_area_
    @primary_service_area_ ||= ServiceArea::Primary.new(
      area_code: service_area.primary_service_area_code
    )
  end

  def additional_service_areas_
    @additional_service_areas_ ||=
      service_area.additional_service_area_codes.map do |sa|
        ServiceArea::Additional.new(area_code: sa)
      end
  end

  def ticket_
    @ticket_ ||= Ticket.new ticket.attributes.merge(
      well_known_text: digsite_info.well_known_text,
      primary_service_area: primary_service_area_,
      additional_service_areas: additional_service_areas_,
      response_due_date_time: date_times.response_due_date_time,
      excavator: excavator_
    )
  end

  def excavator_
    @excavator_ ||= Excavator.new(
      address: excavator.full_address,
      company_name: excavator.company_name,
      crew_onsite: excavator.crew_onsite
    )
  end

  private

  def nested_forms_validation
    %i[digsite_info date_times service_area ticket excavator].each do |key|
      form = public_send key
      errors.add(key, form.errors.messages) unless form.valid?
    end
  end

  def persist!
    ActiveRecord::Base.transaction do
      ticket_.save!
    end
  end
end