Feature:

    Background: pre-conditions
        * def dataGenerator = Java.type('helpers.DataGenerator')
        Given url 'https://conduit.productionready.io/api/'
        
    Scenario: Create new user (Using data generator) and then deleting it
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()        
        Given path 'users'
        And request
        """
            {
                "user": 
                {
                    "email":#(randomEmail),
                    "password":"password",
                    "username":#(randomUsername)
                }
            }
        """
        When method POST
        Then status 200