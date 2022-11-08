Feature: API POST Booking

  Background:
    * url URL
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  @regresion @primercaso
  Scenario Outline: Create booking
    * def body =
        """
        {
          "firstname" : "<nombre>",
          "lastname" : "<apellido>",
          "totalprice" : <precio>,
          "depositpaid" : <deposito>,
          "bookingdates" : {
              "checkin" : "<fecha_inicio>",
              "checkout" : "<fecha_fin>"
           },
          "additionalneeds" : "<adicional>"
         }
        """

    Given path 'booking'
    And request body
    When method post
    Then status 200
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'

    Examples:
      | nombre    | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional |
      | Richard   | Pinedo   | 777    | true     | 2022-07-21   | 2022-07-31 | test      |
      | Francisco | Pinedo   | 333    | true     | 2022-08-06   | 2022-07-31 | test2     |

  @regresion
  Scenario Outline: Create booking data file csv
    * def schema = read('classpath:apis/booking/create/schema.json')
    * def body = read('classpath:apis/booking/create/body.json')

    Given path 'booking'
    And request body
    When method post
    Then status 200
    And  match response == schema
    #And match response.flags contains any {unitedKingdom: '##boolean'}
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'

    * def id = $.bookingid
    * header Accept = 'application/json'
    Given path 'booking' , id
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
      |read('booking_data.csv')|

  @regresion
  Scenario Outline: Create booking data file json
    * def body =
        """
        {
          "firstname" : "<nombre>",
          "lastname" : "<apellido>",
          "totalprice" : <precio>,
          "depositpaid" : <deposito>,
          "bookingdates" : {
              "checkin" : "<fecha_inicio>",
              "checkout" : "<fecha_fin>"
           },
          "additionalneeds" : "<adicional>"
         }
        """

    Given path 'booking'
    And request body
    When method post
    Then status 200
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'

    * def id = $.bookingid
    * header Accept = 'application/json'
    Given path 'booking' , id
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
      |read('booking_data.json')|