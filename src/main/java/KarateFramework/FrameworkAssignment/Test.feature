Feature: karate Framework example

  Scenario: create and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      {
          "name": "ronaldo",
          "job": "test"
      }
      """
    When method POST
    Then status 201
    And match response == { id :'#notnull', name:'ronaldo',job:'test',createdAt:'#notnull'}
    Given path response.id
    And print response

  Scenario: get and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      {
           "name": "George",
           "job": "Bluth"
      }
      """
    When method GET
    Then status 200
    Given path response.id
    And print response


  Scenario: put and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      {
          "name": "George",
          "job": "Bluth"
      }
      """
    When method PUT
    Then status 200
    Given path response.id
    And print response


  Scenario: Patch and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request

      """
      {
          "name": "George",
          "job": "Bluth"
      }
      """
    When method PATCH
    Then status 200
    Given path response.id
    And print response


  Scenario: Delete and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      {
          "name": "George",
          "job": "Bluth"
      }
      """
    When method Delete
    Then status 204
    Given path response.id
    And print response