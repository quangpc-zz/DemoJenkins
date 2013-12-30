Given(/^I am on first screen$/) do
  @first_screen = page(FirstScreen).await
end

Given(/^I decide to change screen$/) do
  @first_screen.click_button
end

Then(/^I should see new screen appear$/) do
  @second_screen = page(SecondScreen).await
end