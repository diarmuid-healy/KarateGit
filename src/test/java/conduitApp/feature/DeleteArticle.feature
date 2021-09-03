Feature: Articles

    Background: Define url
        Given url 'http://conduit.productionready.io/api/'
        * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
        * def token = tokenResponse.authToken
        
    Scenario: Create and Delete new article
        #User token provides authorisation
        Given header Authorization = 'Token ' + token
        #Creating a new article
        Given path 'articles'
        And request {"article": {"tagList": [], "title": "Delete Article", "description": "This is another article which will be deleted", "body": "This is the body of another article which will be deleted"}}
        When method POST
        Then status 200
        * def articleId = response.article.slug 
        
        Given params {limit : 10, offset : 0}
        Given path 'articles'
        When method GET
        Then status 200
        #Checking to see if there is an article named 'Delete Article'
        And match response.articles[0].title == 'Delete Article'

        #Deletes article
        Given header Authorization = 'Token ' + token
        Given path 'articles', articleId
        When method DELETE
        Then status 200

        Given params {limit : 10, offset : 0}
        Given path 'articles'
        When method GET
        Then status 200
        #Checking to see if there is NOT an article named 'Delete Article'
        And match response.articles[0].title != 'Delete Article'
