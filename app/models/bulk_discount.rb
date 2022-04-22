class BulkDiscount < ApplicationRecord
  validates_presence_of :percentage,
                        :quantity_threshold
  belongs_to :merchant
  has_many :items, through: :merchants
end
