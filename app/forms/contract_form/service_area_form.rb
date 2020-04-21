# frozen_string_literal: true

# Nested ServiceArea form object
class ContractForm::ServiceAreaForm < ApplicationForm
  attr_reader :primary_service_area_code, :additional_service_area_codes

  validates :primary_service_area_code, :additional_service_area_codes,
            presence: true
  validates :additional_service_area_codes, length: { minimum: 1 }
  validate :unique_additional_codes
  validate :inclusion_in_both

  def primary_service_area_code=(params = {})
    return if params.blank?

    @primary_service_area_code = find_code params[:sa_code]
  end

  def additional_service_area_codes=(params = {})
    return if params.blank?
    return unless params[:sa_code].respond_to? :each

    codes = params[:sa_code] || []
    @additional_service_area_codes = codes.map(&method(:find_code)).compact
  end

  private

  def inclusion_in_both
    return unless errors.empty?

    code = primary_service_area_code.sa_code
    codes = additional_service_area_codes.map(&:sa_code)
    return unless codes.include? code

    errors.add(
      :additional_service_area_codes,
      "sa_code #{code} can not be used as primary and additional"
    )
  end

  def unique_additional_codes
    return unless errors.empty?

    codes = additional_service_area_codes.map(&:sa_code)
    return if codes.uniq.eql? codes

    errors.add(:additional_service_area_codes, 'sa_code should be uniq')
  end

  def find_code(sa_code = nil)
    return if sa_code.blank?

    AreaCode.find_or_initialize_by(sa_code: sa_code)
  end
end