Feature: Tests for the home page

    Background: Define URL
        Given url apiUrl
        * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
        * def token = tokenResponse.authToken

    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        #-----------------------------------------------------
        #Do tags contain 'public'? = Y
        And match response.tags contains 'public'
        #Do tags contain 'public' AND 'Mature'? = Y
        And match response.tags contains ['public','Mature']
        #Do tags contain 'public' OR 'Fred'? = Y
        And match response.tags contains any ['public','Fred']
        #Do tags NOT contain 'public2'? = Y
        And match response.tags !contains 'public2' 
        #Are the tags a 'String' datatype? = Y
        And match response.tags =="#string"
        
    Scenario:  Get 10 articles from the API
        Given params {limit : 10, offset : 0}
        Given path 'articles'
        When method Get
        Then status 200
        #-----------------------------------------------------
        #Does the response have an array size of 10 = Y
        And match response.articles == '#[10]'
        #Are there '500' articles? = Y
        And match response.articlesCount == 500
        #Are there '100' articles? = Y
        And match response.articlesCount != 100