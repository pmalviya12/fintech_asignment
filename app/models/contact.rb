class Contact < ApplicationRecord
  belongs_to :organization
  has_many :portfolios, dependent: :destroy

  validates :name, :email, presence: true

  def best_portfolio
    portfolios.order(performance: :desc).first
  end

  def worst_portfolio
     portfolios.order(performance: :asc).first
  end
end
