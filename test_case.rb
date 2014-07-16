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
  visit "http://simonmathieu.com/"
  step id: :ignored,
      action: "Look at the page.", 
      response: "Do you see the words \"I'm a software developer\"?" do
    expect(page).to have_content("I'm a software developer")
  end
  step id: :ignored,
      action: "Looks at the page.", 
      response: "Do you see the word \"reliability\"?" do
    expect(page).to have_content("reliability")
  end
  step id: :ignored,
      action: "Look at the page.", 
      response: "Do you see the word \"JavaScript\"?" do
    expect(page).to have_content("JavaScript")
  end
end

