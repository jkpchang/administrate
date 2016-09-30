class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product, presence: true
  validates :order, presence: true
  validates :unit_price, presence: true
  validates :quantity, presence: true

  def total_price
    if unit_price.present?
      unit_price * quantity
    else
      nil
    end
  end
end
