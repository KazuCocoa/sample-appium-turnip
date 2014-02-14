# coding: utf-8

Feature: acceptance test
  Scenario: display the result of google search
    Given test with 'iPhone Simulator'
    Then go to 'https://google.com'
    Then input 'ゆき' in search field
    Then submit form
    Then display search page ?
    Then save screenshot '1'

  Scenario: display the result of google search2
    Given test with 'iPhone Simulator'
    Then go to 'https://google.com'
    Then input '本' in search field
    Then submit form
    Then display search page ?
    Then save screenshot '2'

  Scenario: display the result of google search3
    Given test with 'iPhone Simulator'
    Then go to 'https://google.com'
    Then input '春' in search field
    Then submit form
    Then display search page ?
    Then save screenshot '3'
