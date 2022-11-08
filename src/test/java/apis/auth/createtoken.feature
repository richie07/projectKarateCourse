# new feature
# Tags: optional

Feature: API CREATE Token

  Background:
    * url URL
    * header Content-Type = 'application/json'

  Scenario: Login exitoso
    * def body = read('classpath:apis/auth/body.json')

    Given path 'auth'
    And request body
    When method post
    Then status 200
