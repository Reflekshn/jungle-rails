require 'rails_helper'

RSpec.feature "Visitor navigates to product details from homepage", type: :feature, js: true do

  # SETUP
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

  scenario "They see all products on home page" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    expect(page).to have_css 'article.product', count: 10
  end

  scenario "They click on a product to view product details" do
    visit root_path

    # find('.products').click
    page.find('.products').first(:link, 'Details').click
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    expect(page).to have_css '.products-show', count: 1
  end

end