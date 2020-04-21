# frozen_string_literal: true
#
# ServiceArea model
class AreaCode < ApplicationRecord
  validates :sa_code, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: area_codes
#
#  id         :bigint           not null, primary key
#  sa_code    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_area_codes_on_sa_code  (sa_code) UNIQUE
#
