# frozen_string_literal: true

# ServiceArea model
class ServiceArea < ApplicationRecord
  belongs_to :ticket
  belongs_to :area_code
end

# == Schema Information
#
# Table name: service_areas
#
#  id           :bigint           not null, primary key
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  area_code_id :bigint
#  ticket_id    :bigint
#
# Indexes
#
#  index_service_areas_on_area_code_id  (area_code_id)
#  index_service_areas_on_ticket_id     (ticket_id)
#
# Foreign Keys
#
#  fk_rails_...  (area_code_id => area_codes.id)
#  fk_rails_...  (ticket_id => tickets.id)
#
