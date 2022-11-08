# new feature
# Tags: optional

Feature: API UPDATE Booking

  Background:
    * def res = call read('classpath:apis/auth/createtoken.feature')
    * url URL
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * cookie token = res.response.token

  Scenario Outline: Update exitoso
    * def body = read('bodyPUT.json')

    Given path 'booking' , <id>
    And request body
    When method put
    Then status 200

    Examples:
      | read('booking_data.csv') |

  Scenario: Partial Update booking
  * def body =
     """
      {
         "depositpaid" : true
      }
      """
    Given path 'booking' , 133
    And request body
    When method patch
    Then status 200