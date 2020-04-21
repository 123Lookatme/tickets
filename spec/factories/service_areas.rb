# frozen_string_literal: true

# ServiceArea factory
FactoryBot.define do
  factory :service_area do
    ticket
    area_code

    factory :primary_service_area, class: 'ServiceArea::Primary' do
    end
    factory :additional_service_area, class: 'ServiceArea::Additional' do
    end
  end
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
