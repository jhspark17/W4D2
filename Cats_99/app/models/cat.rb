# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = ["white", "blue", "red", "brown", "black", "yellow"]
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :sex, presence: true, inclusion: ['M', 'F']
  validates :color, presence: true, inclusion: COLORS

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
    dependent: :destroy

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def self.colors
    COLORS
  end
end
