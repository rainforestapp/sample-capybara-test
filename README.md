# sample-capybara-test

## Prerequisites

You will need the following installed on your machine:

1. [Firefox](http://www.mozilla.org/en-US/firefox/new/)
2. [Git](http://git-scm.com/)
3. Ruby 2.1.2

## Setup

Clone the repository:

```bash
git clone git@github.com:rainforestapp/sample-capybara-test.git
cd sample-capybara-test
```

You must use the version or Ruby specified in the `.rvmrc` file. You can check what you have by running ``ruby -v``. If you have [rvm](https://rvm.io/) already installed, you can simply run:

```bash
source ./.rvmrc
```

Then, you must install the dependencies:

```bash
gem install bundler
bundle install
```

## Running the tests

You can then run the tests using the following command:

```bash
bundle exec rainforest_test test_case.rb
```

This MUST work. If we cannot run your spec in this way, we won't consider the contract complete and you will not get paid. Your test does not need to be named `test_case.rb`, but it needs to be in a single file.

## Writing the spec

### Style Guide

While writing code, please use the following guidelines.

#### Avoid using `sleep` whenever possible. 

Capybara usually sleeps automatically until an element is found.

#### Prefer using CSS selector or XPath

We've found that CSS selectors are much more robust to minor page change that XPath. So rather than doing:

```ruby
find(:xpath, "//a[@class='header-logout-link']").click
```

prefer the default Capybara form of:

```ruby
find(".header-logout-link").click
```

an even better way to deal with this problem however is to nos use a matcher at all. Capybara lets you do:

```ruby
click_link "Logout"
```

which is much more robust than using selectors. You should always use this form whenever possible.
#### Beware of `first`

The first helper in Capybara is a useful tool. However, you need to aware that it does not wait for the element to be present on the page. In other words, if the page is still loading, the call to `first` will wait.

So rather than doing:

```ruby
first('.my_class')
```

you can do:

```ruby
find('.my_class', match: :first)
```

#### Don't assume elements ordering

Avoid writing code like this:

```ruby
inputs = all('input')
inputs[0].click
inputs[0].native.send_keys("4242424242424242")
inputs[1].native.send_keys("123")
inputs[1].click
```

This makes for an easily breakable test since the elements could be reordered or restyled. A better version is:

```ruby
fill_in ".some-selector", with: '4242424242424242'
fill_in ".some-other-selector", with: '123'
```

That way, if there's a slight change to the web page, the test does not completely break.

#### Exceptions

It's bad practice to use exceptions to control flows and rescuing exceptions. For instance,

```ruby
begin
  find('.something').click
  page.driver.browser.switch_to.alert.accept
rescue
end    
```

`rescue` in ruby will catch any exception and makes it difficult to understand what happen. If you want to check if an element exists, use the Capybara methods:

```ruby
if page.has_selector?('.something')
  find('.something').click
  page.driver.browser.switch_to.alert.accept
end
```

If you expect that value to be there always, you can use an assertion to validate that it is there:

```ruby
  expect(page).to have_selector('.something')
  find('.something').click
  page.driver.browser.switch_to.alert.accept
end
```

This way, the exception raised by the run time is meaningful. 

#### Indentation

Indentation must be 2 spaces. Do NOT use tabs.

#### Avoid changing the template as much as possible

Try to limit your changes to the block of the `step` method. You can put code outside of it if needed, for instance to share state across multiple steps. However, we'd like most of the logic of the step to be encapsulated within the step.

### Interpolated values

While reading the step instructions, it's possible you see something like `{{ random.number }}` or ``{{ randome.email }}``. These values are interpolated values. Although we'll build native support for those in the runtime, for now, just replace them with something sane and in the spirit of what they should be. 

For instance, `{{ random.email }}` could be something like:

```ruby
    "test+#{test_id}+{Time.now.to_i}@examle.org"
```

#### User defined variable

It's possible that the test contains something like:

```ruby
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
```

These variables are defined by our system when we run. Their values will change with each run. We use them to avoid clashes when running tests in parallel on the same server.

By default, we provide a sample value of what this variable could be. It's possible that you might have to edit those in your test to get them to always pass. For instance, here `client_no` could be something like `rand(200).to_s`.

Any code you put in the body of `define_variable_scope` will be ignore when we run those tests in production. This helper is only there for you to use when developing.

One a variable is define, you can use it anywhere in the body of the test. For instance, the previous example would make `logins.password` and `logins.client_no` available in the test. You can then write somethin like:

```ruby
step id: 123,
    action: "Login with the email \"t-{{ logins.client_no }}@e.rainforestqa.com\" and the password \"{{ logins.password }}\". If you are already logged in, log out first. ", 
    response: "Did you get logged in successfully? " do
  # *** START EDITING HERE ***

  fill_in :email, with: "t-#{logins.client_no}@e.rainforestqa.com"
  fill_in :password, with: logins.password
  # ...
end

```

## Starting a new test

If you automate multiple tests for us, make sure you always work from the latest version of this repository.

To get the latest version, use the following commands:

```bash
git pull origin master
bundle install
```

## Advance features

### Timeouts

By default, we have configured Capybara to timeout after 20 seconds. This can be a little long and annoying while developing. This value is configurable through an environment variable.

```bash
CAPYBARA_WAIT_TIME=1 bundle exec rainforest_test test_case.rb
```

## Help!

If you find a bug with this, please email [qe@rainforestqa.com](mailto:qu@rainforestqa.com)
