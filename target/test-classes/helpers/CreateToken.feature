Feature: Create token

    Scenario: Create Token Feature
        Given url 'https://conduit.productionready.io/api/'
        Given path 'users/login'
        And request {"user":{"email":"jackbuzzhealy1996@gmail.com","password":"password"}}
        When method POST
        Then status 200
        * def token = response.user.token