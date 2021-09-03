Feature: Create token

    Scenario: Create a new article
        Given url apiUrl
        Given path 'users/login'
        #Logging in via POST request
        And request {"user":{"email":"#(userEmail)", "password":"#(userPassword)"}}
        When method POST
        Then status 200
        #Retrieve unique user token
        * def authToken = response.user.token