@parabank_transfer
Feature: Tranfer to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountFrom = 69510
    * def accountto = 69621
    * def amount = 150

  Scenario: Customer Transfer
      Given path 'transfer'
      And param fromAccountId = accountFrom
      And param toAccountId = accountto
      And param amount = amount
      When method POST
      Then status 200
      And match response contains 'Successfully transferred'
