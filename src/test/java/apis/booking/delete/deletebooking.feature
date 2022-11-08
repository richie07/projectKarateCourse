# new feature
# Tags: optional

Feature: API Delete booking
  Background:
    * def res = call read('classpath:apis/auth/createtoken.feature')
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * cookie token = res.response.token

  Scenario: Delete successfully
    Given path 'booking' , 116
    When method delete
    Then status 200