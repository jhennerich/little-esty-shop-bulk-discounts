require 'rails_helper'

RSpec.describe 'Bulk Discount Index Page' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @merchant2 = Merchant.create!(name: 'Jewelry')

    @bulk_discount = BulkDiscount.create!(name: "Discount A", percentage: 20, quantity_threshold: 10, merchant_id: @merchant1.id)
    @bulk_discount2 = BulkDiscount.create!(name: "Discount B", percentage: 30, quantity_threshold: 15, merchant_id: @merchant1.id)
    @bulk_discount3 = BulkDiscount.create!(name: "Discount C", percentage: 35, quantity_threshold: 25, merchant_id: @merchant2.id)
    @bulk_discount4 = BulkDiscount.create!(name: "Discount Z", percentage: 10, quantity_threshold: 10, merchant_id: @merchant2.id)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
    @customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Carrey')
    @customer_4 = Customer.create!(first_name: 'Leigh Ann', last_name: 'Bron')
    @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
    @customer_6 = Customer.create!(first_name: 'Herber', last_name: 'Kuhn')

    @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 1)
    @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 1)
    @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 1)
    @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 1)
    @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 1)
    @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 1)
    @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 0)

    @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id)
    @item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: @merchant1.id)
    @item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant1.id)
    @item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant1.id)

    @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 1, unit_price: 8, status: 0)
    @ii_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 2)
    @ii_4 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_5 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)

    @transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
    @transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_3.id)
    @transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_4.id)
    @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_5.id)
    @transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_6.id)
    @transaction6 = Transaction.create!(credit_card_number: 879799, result: 1, invoice_id: @invoice_7.id)
    @transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_2.id)

    visit merchant_bulk_discounts_path(@merchant1)
  end

  it 'displays bulk discounts information' do
    expect(page).to have_content(@bulk_discount.name)
    expect(page).to have_content(@bulk_discount.percentage)
    expect(page).to have_content(@bulk_discount.quantity_threshold)

    expect(page).to have_content(@bulk_discount2.percentage)
    expect(page).to have_content(@bulk_discount2.quantity_threshold)

    expect(page).to_not have_content(@bulk_discount3.name)
    expect(page).to_not have_content(@bulk_discount4.name)
  end

  it "has a link to each discounts show page" do
    expect(page).to have_link(@bulk_discount.name)
    expect(page).to have_link(@bulk_discount2.name)
    click_on(@bulk_discount.name)
    expect(current_path).to eq("/merchants/#{@merchant1.id}/bulk_discounts/#{@bulk_discount.id}")
  end

  it "has upcoming holidays" do

    expect(page).to have_content("Upcoming Holidays")
    expect(page).to have_content("Memorial Day")
    expect(page).to have_content("2022-05-30")

    expect(page).to have_content("Juneteenth")
    expect(page).to have_content("2022-06-20")

    expect(page).to have_content("Independence Day")
    expect(page).to have_content("2022-07-04")
  end
end
