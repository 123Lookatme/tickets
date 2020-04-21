# frozen_string_literal: true

# AreaCode factory
FactoryBot.define do
  factory :area_code do
    sa_code { Faker::Code.asin }
  end
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
