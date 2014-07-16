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

This MUST work. If we cannot run your spec in this way, we won't consider the contract complete and you will not get paid.

## Writing the spec

### Style Guide

While writing code, please use the following guidelines.

#### Avoid using `sleep` whenever possible. 

Capybara usually sleeps automatically until an element is found.

#### Indentation

Indentation must be 2 spaces. Do NOT use tabs.

#### Avoid changing the template as much as possible

Try to limit your changes to the block of the `step` method. You can put code outside of it if needed, for instance to share state across multiple steps. However, we'd like most of the logic of the step to be encapsulated within the step.

## Help!

If you find a bug with this, please email [qe@rainforestqa.com](mailto:qu@rainforestqa.com)
