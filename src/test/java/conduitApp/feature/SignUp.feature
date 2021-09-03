Feature:

    Background: pre-conditions
        Given url apiUrl
    Scenario: Create new user 
        Given def userData = {"email":"testuser01@gmail.com","username":"testuser01"}
        Given path 'users'
        And request
        """
            {
                "user:"
                {
                    "email":#('test' + userData.email),
                    "password":"password",
                    "username":#('User' + userData.username)
                }
            }
        """
        When method POST
        Then status 200