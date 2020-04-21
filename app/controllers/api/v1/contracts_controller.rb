# frozen_string_literal: true

module API
  module V1
    # API controller contracts/
    class ContractsController < ApplicationController

      def create
        ContractForm.new(
          excavator_attributes: excavator_params,
          ticket_attributes: ticket_params,
          service_area_attributes: service_area_params,
          digsite_info_attributes: digsite_info_params,
          date_times_attributes: date_times_params
        ).submit!

        head :created
      end

      private

      def excavator_params
        allowed = %i[company_name address city state zip crew_onsite]
        params.require(:excavator).permit allowed
      end

      def digsite_info_params
        params.require(:excavator_info).require(:digsite_info).permit(:well_known_text)
      end

      def date_times_params
        params.require(:date_times).permit(:response_due_date_time)
      end

      def ticket_params
        params.permit %i[request_number sequence_number request_type]
      end

      def service_area_params
        params.require(:service_area).permit(
          primary_service_area_code: :sa_code,
          additional_service_area_codes: { sa_code: [] }
        )
      end
    end
  end
end