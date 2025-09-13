class Portfolio < ApplicationRecord
  belongs_to :contact
  validates :name, presence: true
  validates :balance, presence: true
  validates :performance, presence: true
end
