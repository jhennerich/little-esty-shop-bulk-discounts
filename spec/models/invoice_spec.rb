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

      @ii1 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item1.id, status: 1, quantity: 20, unit_price: 1000)
      @ii2 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item2.id, status: 1, quantity: 5, unit_price: 1200)

    end
    it "returns total revenue from all items in invoice" do
      expect(@invoice1.total_rev).to eq(26000)
    end

    it "#pending_invoices" do
      expect(Invoice.pending_invoices).to eq([@invoice2])
    end

    it "#format_time" do
      expect(@invoice2.format_time).to eq(Time.now.utc.strftime('%A, %B %e, %Y'))
    end

    it '#total_discounted_rev' do
      @merchant1 = Merchant.create!(name: 'Hair Care')
      @merchant2 = Merchant.create!(name: 'Skin Care')


      @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
      @item_2 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)

      @item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant2.id)
      @item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant2.id)

      @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      @customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')

      @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 1)
      @invoice_2 = Invoice.create!(customer_id: @customer_2.id, status: 1)

      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 10, unit_price: 1000, status: 2) #rev 10000
      @ii_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 10, unit_price: 1000, status: 1) #rev 10000


      @ii_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 5, unit_price: 1000, status: 2)
      @ii_4 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_4.id, quantity: 5, unit_price: 2000, status: 1)

      @bulk_discount = BulkDiscount.find_or_create_by!(name: "Discount A", percentage: 20, quantity_threshold: 10, merchant_id: @merchant1.id)
      @bulk_discount2 = BulkDiscount.find_or_create_by!(name: "Discount C", percentage: 10, quantity_threshold: 10, merchant_id: @merchant1.id)
      @bulk_discount3 = BulkDiscount.find_or_create_by!(name: "Discount D", percentage: 10, quantity_threshold: 10, merchant_id: @merchant2.id)

      expect(@invoice_1.total_discounted_rev.to_f).to eq(16000.0)
      expect(@invoice_2.total_discounted_rev.to_f).to eq(15000.0)
    end
  end
end
