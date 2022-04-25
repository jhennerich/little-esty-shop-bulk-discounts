class Invoice < ApplicationRecord
  validates_presence_of :status
  validates_presence_of :customer_id

  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants
  has_many :transactions

  enum status: {"in progress" => 0, "completed" => 1, "cancelled" => 2}

  def self.pending_invoices
    where(status: 0)
    .order(:created_at)
  end

  def format_time
    created_at.strftime('%A, %B %e, %Y')
  end

  def total_rev
    invoice_items.sum("quantity * unit_price")
  end

  def total_discounted_rev
#    merch_id = merchants.group(:id).first.id
#    best_discount = bulk_discounts.where(merchant_id: merch_id).group(:id).order(:percentage).last
#    binding.pry
#    invoice_items.each do |inv|
#      binding.pry
#      inv.discounted_amount
#    end

#    invoice_items.where
#    merchants.group(:id).where('bulk_discount.quantity_threshold = ?', '10')
#    array = invoice_items.joins(item: :bulk_discounts)
#            .where('quantity >= bulk_discounts.quantity_threshold').group(:id)
#    discount = invoice_items.joins(:bulk_discounts)
#                                      .where('invoice_items.quantity >= bulk_discounts.quantity')
#                                      .select('invoice_items.id, max(invoice_items.unit_price * invoice_items.quantity *(bulk_discounts.discount)/100.00) as total_discount')
#                                      .group('invoice_items.id')
#                                      .sum(&:total_discount)
#    total_rev - discount
  end
end
