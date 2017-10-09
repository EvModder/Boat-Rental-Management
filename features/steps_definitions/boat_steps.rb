
When(/^I go to the boat index page$/) do
  visit boats_path
end

Then(/^I should see the renting boats$/) do
  expect(page).to have_content("Listing Boats")
end

