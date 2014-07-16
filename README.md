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

## Style Guide

- Avoid using sleep whenever possible
- 2 spaces, no tab
- avoid changing the template as much as possible
