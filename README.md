# sample-capybara-test

## Setup

You must have [Firefox](http://www.mozilla.org/en-US/firefox/new/) installed.


You must use the version or ruby specified in the `.rvmrc` file. If you have [rvm](https://rvm.io/) already installed, you can simply run

```bash
source ./.rvmrc
```

Then, you must install the dependencies:

```bash
gem install bundler
bundle install
```

## Runing the spec

You can then run the specs using the following command:

```bash
bundle exec rainforest_test test_case.rb
```

This MUST work. If we cannot run your spec in this way, we won't consider the contract complete.

## Writing the spec

## Style Guide

While writing code, please use the following guidelines.

### Avoid using `sleep` whenever possible. 

Capybara usually sleeps automatically until an element is found.

### 2 spaces, no tab

Indentation should be 2 spaces. Use SPACES, not tabs.

### Avoid changing the template as much as possible

Try to limit your changes to the block of the `step` method. You can put code outside of it if needed, for instance to share state across multiple steps. However, we'd like most of the logic of the step to be encapsulated within the step.

## Help!

If you find a bug with this, please email [qe@rainforestqa.com](mailto:qu@rainforestqa.com)
