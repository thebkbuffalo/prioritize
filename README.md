# Priori Rails and Vue Coding Challenge

This exercise is designed for you to demonstrate familiarity and expertise with Ruby on Rails and Vue.

## Requirements

The rails app has a single model, `Task`, with the following fields:

Field        | Format
---          | --- 
Description  | string, null: false
Completed    | boolean, null: false, default: false

When viewing the root page (`localhost:3000/`), an index view of all currently available tasks is shown. The list is rendered with Vue.

To complete this challenge, the following criteria should be met:

1. I should be able to mark tasks as completed.
2. When viewing the index, I should only see incomplete tasks.
3. When viewing the index, I should be able to click a button and see a list of all tasks, both incomplete and complete (this can be a same-page toggle, a new page, or whatever you find best)
4. I should be able to visually distinguish between completed tasks and incomplete tasks.

All changes should be persisted in the database.

All interface components should be rendered with Vue (eg. you should not create an ERB page for the full task list). Rails should only be used for updating and provisioning data.

## Installation

To install, run the following commands in the root of the Rails application:

`bundle install`

`bundle exec rake db:create`

`bundle exec rake db:migrate`

If you would like to use the available seed Task data (not required), run the following command as well.

`bundle exec rake db:seed`

## Permitted Tools

You may use the already installed tools (Rails core, VueJS, axios, Lodash). You may also add RSpec, Capybara, Mocha, Jest, and related tools if you would like to add tests. If there are any other packages you would like to use, please run it by us first.

## Packaging Requirements

Please package the code in a zip or tar archive when you send it to use
