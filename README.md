## Manual Cucumber Testing Framework

This is a simple framework for performing manual tests using [Cucumber](http://cukes.info)

This framework allows you to run your feature files and will prompt for your input after each step in all scenarios.

For example:

    Feature: Search for Cheese on Google
        Given I am on the Google search page
            *Is this correct [y|n]*
        When I search for 'Cheese'
            *Is this correct [y|n]*
        Then I should see search results containing 'Cheddar'
            *Is this correct [y|n]*

By default we generate a time stamped report which will appear in the root directory of the project.

### Pre Requisites

* Ruby 1.9.x
* Ruby Gems > 1.3.6
* Bundler Gem
* Xcode + Command Line Tools (Mac)

[Full Setup Guide](https://)

### Installation

Download the [zip file](https://github.com/ITV/manual_cukes/zipball/master) and extract to a location of your choice, then:

    bundle install

### Usage

    rake PROJECT=YOUR_PROJECT_NAME

### Cucumber's Dry-run

    rake dry_run

### Single Scenario's

    cucumber features/FEATURE_NAME

### ToDo: 

- Look into tidy up of Cucumber reports (removing the errors and include the bug messages)
- Improve the failed steps - to give the ability to add failed tests messages
- How to run single feature file and tags
- Check it works OK when mixed with automated tests
