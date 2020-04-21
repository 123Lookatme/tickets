# frozen_string_literal: true

# Nested Ticket form object
class ContractForm::TicketForm < ApplicationForm
  attr_accessor :request_number, :sequence_number, :request_type

  validates :request_number, :sequence_number, :request_type, presence: true
  validates :request_number, format: { with: /\d+-\d+/ }
  validates :sequence_number, numericality: { greater_than: 0 }
  validates :request_type, inclusion: { in: Ticket.request_types.keys }
  validate :unique_request_number

  private

  def unique_request_number
    return unless Ticket.where(request_number: request_number).present?

    errors.add(:request_number, 'Already exists')
  end
end