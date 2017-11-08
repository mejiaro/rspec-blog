require "rails_helper"

RSpec.feature "Show article" do

	before do
		@article = Article.create(title: Faker::RickAndMorty.quote, 
								  body: Faker::RickAndMorty.quote)
	end

	scenario "Show Article" do
		visit article_path(@article)
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end

	scenario "Article not found" do
		
	end
end