Feature: Articles

    Background: Define url
        Given url apiUrl
        * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    Scenario: Create new article
        #User token provides authorisation
        Given header Authorization = 'Token ' + token
        #Creating a new article
        Given path 'articles'
        And request {"article": {"tagList": [], "title": "Another Article", "description": "This is another article", "body":"This is the body of another article"}}
        When method POST
        Then status 200
        #Checking to see if there is an article named 'Another Article'
        And match response.article.title == 'Another Article'