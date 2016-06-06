# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search?zip=80203"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
require 'rails_helper'


RSpec.describe "user can search by zipcode" do
  it "returns list of 10 closet stations within 6 miles sorted by distance and limited to electric and propane" do

    visit"/"

    fill_in :zip, with: "80203"
    fill_in :distance, with: "6"
    click_on "Locate"

    expect(page).to have_content("Name: UDR Address: 800 Acoma St Fuel types: ELEC Distance: 0.3117 miles Access times: 24 hours daily")

  end

# When I visit "/"
# And I fill in the search form with 80203
# And I enter "5" into an optional "Distance" field
# And I click "Locate"
# Then I should see a list of the 10 closest stations of any type within 5 miles sorted by distance
# And the results should share the same format as above
# And I should see about 6 pagination links at the bottom of the results (As of the writing of this story there are 63 results. Number of links should be RESULTS divided by 10)

  scenario " returns list of closest stations within 5 miles sorted by distance and limited to electric and propane" do

    visit "/"
    
    fill_in :zip, with: "80203"
    fill_in :distance, with: "5"
    click_on "Locate"

    expect(page).to have_content("Name: UDR Address: 800 Acoma St Fuel types: ELEC Distance: 0.3117 miles Access times: 24 hours daily")

  end

end
