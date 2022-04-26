require 'rails_helper'

RSpec.describe "Bulk Discount edit page" do
  before :each do
    @merch = Merchant.create!(name:"StarWars R Us")
    @bulk_discount = @merch.bulk_discounts.create!(name: "DiscountA", percentage: 10, quantity_threshold: 10)
  end

  it "has form to edit a discount" do
    visit edit_merchant_bulk_discount_path(@merch, @bulk_discount)

    fill_in("Name", with: 'May the Fourth')
    fill_in('Percentage', with: 10)
    fill_in('Quantity Threshold', with: 10)

    click_button("Update")
    expect(current_path).to eq( merchant_bulk_discounts_path(@merch))
    expect(page).to have_content("May the Fourth")
  end
end
