require 'rails_helper'

RSpec.describe "Bulk Discount new page" do
  before :each do
    @merch = Merchant.create(name:"StarWars R Us")
    @bulk_discount = BulkDiscount.create(name: "DiscountA", percentage: 10, quantity_threshold: 10)
  end

  it "has form to create new application" do
    visit new_merchant_bulk_discount_path(@merch)
    fill_in("Name", with: 'May the Fourth')
    fill_in('percentage', with: 10)
    fill_in('quantity_threshold', with: 10)

    click_button("Submit")
    expect(current_path).to eq( merchant_bulk_discounts_path(@merch))
    expect(page).to have_content("May the Fourth")
  end
end
