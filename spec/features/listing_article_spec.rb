require 'rails_helper'

RSpec.feature "Listing articles" do

	before do
		@article0 = Article.create(title: Faker::RickAndMorty.quote, 
								  body: Faker::RickAndMorty.quote)

		@article1 = Article.create(title: Faker::RickAndMorty.quote,
								   body: Faker::RickAndMorty.quote)
	end

	scenario "List all articles" do
		visit "/"

		expect(page).to have_content(@article0.title)
		expect(page).to have_content(@article1.title)

		expect(page).to have_link(@article0.title)
		expect(page).to have_link(@article1.title)
	end
end