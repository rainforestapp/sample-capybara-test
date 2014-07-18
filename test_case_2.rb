# To execute this code, you require the rainforest_ruby_runtime. https://github.com/rainforestapp/rainforest_ruby_runtime
#
# The best way to get started is to have a look at our sample tests here:
# https://github.com/rainforestapp/sample-capybara-test
#
# Please only edit code within the `step` blocks.
#
# You can use any RSpec 3 assertion and Capybara method
#
define_variable_scope :logins do
  define_variable :password do
    # By default, this returns a sample value we random picked from a list of
    # possible value. If this is preventing your test from running, you can
    # change this method to generate a more appropriate value.
    "83d9465c9"
  end

  define_variable :client_no do
    # By default, this returns a sample value we random picked from a list of
    # possible value. If this is preventing your test from running, you can
    # change this method to generate a more appropriate value.
    "170"
  end
end

test(id: 951, title: "Switch to a pricing plan") do
  # You can use any of the following variables in your code:
  # - logins.client_no
  # - logins.password

  visit "https://app.rnfrstqa.com/login"
  step id: :ignored,
      action: "Login with the email \"t-{{ logins.client_no }}@e.rainforestqa.com\" and the password \"{{ logins.password }}\". If you are already logged in, log out first. ", 
      response: "Did you get logged in successfully? " do
    # *** START EDITING HERE ***

    fill_in :email, with: "t-#{logins.client_no}@e.rainforestqa.com"
    fill_in :password, with: logins.password

    click_button 'Login'

    expect(page).to have_content("Tests")
    expect(page).to have_content("Runs")

    # *** STOP EDITING HERE ***
  end
  visit "https://app.rnfrstqa.com/settings/plans"
  step id: :ignored,
      action: "Locate a pricing plan that the account is currently not subscribed to. Switch to this pricing plan. If you get an error message being already subscribed to that plan. Try again with a different pricing plan.", 
      response: "Did you get a success message?" do
    # *** START EDITING HERE ***
    # Replace this comment with the code for this action and response here.


    accept_prompt do
      expect(page).to have_css("button.switch-buton-child")
      first("button.switch-buton-child").click
    end

    expect(page).to have_content("Plan switched")

    # *** STOP EDITING HERE ***
  end
end
