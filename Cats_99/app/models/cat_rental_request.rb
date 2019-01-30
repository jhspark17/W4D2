# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  
  validates :cat_id, presence: true 
  validates :start_date, presence: true 
  validates :end_date, presence: true 
  validates :status, presence: true, inclusion: ['PENDING', 'APPROVED', 'DENIED']

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    requests = CatRentalRequest.where(start_date: ())
  end
end
