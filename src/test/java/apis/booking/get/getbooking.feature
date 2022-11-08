Feature: API GET Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'

  Scenario: Get all booking
    Given path 'booking'
    When method get
    Then status 200
    * def registros = response.length
    * print 'Número de registros -->' , registros
    * def id =  response[1].bookingid

    * header Accept = 'application/json'
    Given path 'booking' , id
    When method get
    Then status 200

  Scenario Outline: Get details booking
    * header Accept = 'application/json'
    Given path 'booking' , <id>
    When method get
    Then status 200
    And match $.firstname == '<nombre>'
    And match $.lastname == '<apellido>'
    And match $.totalprice == <precio>
    And match $.depositpaid == <deposito>
    And match $.bookingdates.checkin == '<fecha_inicio>'
    And match $.bookingdates.checkout == '<fecha_fin>'
    And match $.additionalneeds == '<adicional>'

    Examples:
      | id  | nombre  | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional |
      | 296 | chintan | tank     | 771    | true     | 2022-07-21   | 2022-07-31 | Breakfast |