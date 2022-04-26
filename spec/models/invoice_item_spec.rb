require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :invoice_id }
  end
  describe "relationships" do
     it { should belong_to :item }
     it { should belong_to :invoice }
  end

  describe 'instance methods' do
    it '#discount_used' do

      @merchant1 = Merchant.create!(name: "Pabu")

      @bulk_discount1 = @merchant1.bulk_discounts.create!(name: "Discount A", percentage: 20, quantity_threshold: 10)
      @bulk_discount2 = @merchant1.bulk_discounts.create!(name: "Discount B", percentage: 10, quantity_threshold: 5)

      @item1 = Item.create!(name: "Brush", description: "Brushy", unit_price: 10, merchant_id: @merchant1.id)
      @item2 = Item.create!(name: "Peanut Butter", description: "Yummy", unit_price: 12, merchant_id: @merchant1.id)

      @customer1 = Customer.create!(first_name: "Loki", last_name: "R")

      @invoice1 = @customer1.invoices.create!(status: "completed")

      @ii1 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item1.id, status: 1, quantity: 20, unit_price: 100) #2000
      @ii2 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item2.id, status: 1, quantity: 5, unit_price: 120) #600
      @ii3 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item1.id, status: 1, quantity: 1, unit_price: 100) #3000

      expect(@ii1.discount_used).to eq(@bulk_discount1)
      expect(@ii2.discount_used).to eq(@bulk_discount2)
      expect(@ii3.discount_used).to eq(nil)
    end
  end
end
