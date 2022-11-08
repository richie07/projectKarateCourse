# new feature
# Tags: optional

Feature: API GET PING

  Background:
  * url URL

  Scenario: Verificar PING
    Given path 'ping'
    When method get
    Then status 201