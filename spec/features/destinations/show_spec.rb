require 'rails_helper'

describe "Search Path" do
  before :each do
    @destination = Destination.create(name: "Arkansas", zip: '72034', description: "Home", image_url: '')
    visit root_path
    save_and_open_page
    within (".destination-#{@destination.id}") do
      expect(page).to have_link("Show")
      click_on "Show"
    end
  end
  describe "As a user," do
    describe "When I visit '/' and I click on a destination" do
      it "Then I should be on page '/destinations/:id'" do

        expect(current_path).to eq ("/destinations/#{@destination.id}")
      end
      it "Then I should see the destination's name, zipcode, description" do
        expect(page).to have_content("Arkansas")
        expect(page).to have_content("72034")
        expect(page).to have_content("Description: Home")
      end
      describe "Then I should see the current weather for the destination" do
        it "The forecast should include date, current, high & low temps in F, and summary" do
          expect(page).to have_content("Forecast for Arkansas")

        end
      end
    end
  end
end
