# frozen_string_literal: true

# Excavator model
class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :address, :company_name, presence: true
end

# == Schema Information
#
# Table name: excavators
#
#  id           :bigint           not null, primary key
#  address      :string
#  company_name :string
#  crew_onsite  :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ticket_id    :bigint
#
# Indexes
#
#  index_excavators_on_ticket_id  (ticket_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#
