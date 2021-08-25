require 'rails_helper'

RSpec.feature "Visitor can add an item to their cart from the homepage.", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "An item is added to the cart" do
    visit root_path
    
    first('.product').click_on('Add')
   
    expect(page).to have_text 'My Cart (1)'
  end

end
