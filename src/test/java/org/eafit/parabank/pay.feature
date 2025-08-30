@parabank_transfer
Feature: Pay to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountFrom = 18006
    * def amount = 150
    * def name =  'Prueba Juan 3'
    * def street = 'test street'
    * def city = 'test city'
    * def state = 'test state'
    * def zipcode = 'test zipcode'
    * def phoneNumber = 'Test phone'
    * def accountNumber = 21669

  Scenario: Customer Pay
      Given path 'billpay'
      And param accountId = accountFrom
      And param amount    = amount
      And request
    """
    {
      "name": "#(name)",
      "address": {
        "street": "#(street)",
        "city": "#(city)",
        "state": "#(state)",
        "zipCode": "#(zipCode)"
      },
      "phoneNumber": "#(phoneNumber)",
      "accountNumber": #(accountNumber),
    }
    """
      When method POST
      Then status 200 

