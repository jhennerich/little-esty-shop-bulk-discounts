Transaction.destroy_all
InvoiceItem.destroy_all
Item.destroy_all
Invoice.destroy_all
Customer.destroy_all
BulkDiscount.destroy_all
Merchant.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('merchants')
ActiveRecord::Base.connection.reset_pk_sequence!('bulk_discounts')
ActiveRecord::Base.connection.reset_pk_sequence!('customers')
ActiveRecord::Base.connection.reset_pk_sequence!('invoices')
ActiveRecord::Base.connection.reset_pk_sequence!('items')
ActiveRecord::Base.connection.reset_pk_sequence!('invoice_items')
ActiveRecord::Base.connection.reset_pk_sequence!('transactions')

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

@item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 1000, merchant_id: @merchant1.id)
@item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 800, merchant_id: @merchant1.id)
@item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 500, merchant_id: @merchant1.id)
@item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 100, merchant_id: @merchant1.id)

@ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 1000, status: 2)
@ii_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 15, unit_price: 800, status: 0)
@ii_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 1, unit_price: 500, status: 2)
@ii_4 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 1, unit_price: 500, status: 1)
@ii_5 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 1, unit_price: 500, status: 1)
@ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 500, status: 1)
@ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_4.id, quantity: 1, unit_price: 500, status: 1)
@ii_8 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 1000, status: 2)

@transaction1 = Transaction.create!(credit_card_number: 203942, result: 'success', invoice_id: @invoice_1.id)
@transaction2 = Transaction.create!(credit_card_number: 230948, result: 'success', invoice_id: @invoice_3.id)
@transaction3 = Transaction.create!(credit_card_number: 234092, result: 'success', invoice_id: @invoice_4.id)
@transaction4 = Transaction.create!(credit_card_number: 230429, result: 'success', invoice_id: @invoice_5.id)
@transaction5 = Transaction.create!(credit_card_number: 102938, result: 'success', invoice_id: @invoice_6.id)
@transaction6 = Transaction.create!(credit_card_number: 879799, result: 'success', invoice_id: @invoice_7.id)
@transaction7 = Transaction.create!(credit_card_number: 203942, result: 'success', invoice_id: @invoice_2.id)
