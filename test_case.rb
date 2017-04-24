# To execute this code, you require the rainforest_ruby_runtime. https://github.com/rainforestapp/rainforest_ruby_runtime
#
# The best way to get started is to have a look at our sample tests here:
# https://github.com/rainforestapp/sample-capybara-test
#
# Please only edit code within the `step` blocks.
#
# You can use any RSpec 3 assertion and Capybara method
#
test(id: 2909, title: "Test success") do
  visit "https://rsmith.co/"
  step id: :ignored,
      action: "Look at the page.", 
      response: "Do you see the words \"I love coffee, cars and programming.\"?" do
    expect(page).to have_content("I love coffee, cars and programming.")
  end
  step id: :ignored,
      action: "Looks at the page.", 
      response: "Do you see the word \"More information\"?" do
    expect(page).to have_content("More information")
  end
  step id: :ignored,
      action: "Look at the page.", 
      response: "Do you see the word \"CTO\"?" do
    expect(page).to have_content("CTO")
  end
end

