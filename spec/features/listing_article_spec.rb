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

	scenario "No articles" do
		Article.delete_all

		visit "/"


		expect(page).not_to have_content(@article0.title)
		expect(page).not_to have_content(@article1.title)

		expect(page).not_to have_link(@article0.title)
		expect(page).not_to have_link(@article1.title)

		within("h1#no-articles") do 
			expect(page).to have_content("No articles created")
		end


	end
end