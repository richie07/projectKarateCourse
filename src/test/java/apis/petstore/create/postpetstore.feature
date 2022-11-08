# new feature
# Tags: optional

Feature: API POST PetStore

  Background:
    * url 'https://petstore.swagger.io/v2/'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario Outline: A scenario
    * def schema =
    """
          {
               code: '#number',
               type: '#string',
               message: '#string'
          }    
    """
    * def body =
        """
          {
               "username": "<userName>",
               "firstName": "<firstName>",
               "lastName": "<lastName>",
               "email": "<email>",
                "password": "<password>",
                "phone": "<phone>",
                "userStatus": <userStatus>
          }
        """

    Given path 'user'
    And request body
    When method post
    Then status 200
    And match response == schema
    And match $.type == '<type>'
    And match $.code == 200

    * header Accept = 'application/json'
    Given path 'user' , '<userName>'
    When method get
    Then status 200
    And match $.username == '<userName>'
    And match $.firstName == '<firstName>'
    And match $.lastName == '<lastName>'
    And match $.email == '<email>'
    And match $.password == '<password>'
    And match $.phone == '<phone>'
    And match $.userStatus == <userStatus>
    
    Examples:
      | userName | firstName | lastName | email                 | password | phone     | userStatus | type    |
      | user01   | Richard   | Pinedo   | richiefpc@gmail.com   | 123pas   | 986473820 | 0          | unknown |
      | user02   | Francisco | Pinedo   | richiefpc@gmail.com   | test01   | 982333233 | 0          | unknown |

