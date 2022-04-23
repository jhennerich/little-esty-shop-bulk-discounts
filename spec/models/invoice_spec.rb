require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of :status}
    it { should validate_presence_of :customer_id }
  end
  describe "relationships" do
     it { should belong_to :customer }
     it { should have_many :transactions }
     it { should have_many(:items).through(:invoice_items) }
     it { should have_many(:merchants).through(:items) }
  end

  describe 'instance methods' do
    before :each do
      @merchant1 = Merchant.create!(name: "Pabu")

      @item1 = Item.create!(name: "Brush", description: "Brushy", unit_price: 10, merchant_id: @merchant1.id)
      @item2 = Item.create!(name: "Peanut Butter", description: "Yummy", unit_price: 12, merchant_id: @merchant1.id)

      @customer1 = Customer.create!(first_name: "Loki", last_name: "R")

      @invoice1 = @customer1.invoices.create!(status: "completed")
      @invoice2 = @customer1.invoices.create!(status: 0)

      @ii1 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item1.id, status: 1, quantity: 20, unit_price: 10)
      @ii2 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item2.id, status: 1, quantity: 5, unit_price: 12)
    end
    it "returns total revenue from all items in invoice" do
      expect(@invoice1.total_rev).to eq(260)
    end

    it "#pending_invoices" do
      expect(Invoice.pending_invoices).to eq([@invoice2])
    end

    it "#format_time" do
      expect(@invoice2.format_time).to eq(Time.now.strftime('%A, %B %e, %Y'))
    end
  end
end
