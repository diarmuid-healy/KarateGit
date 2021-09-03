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
        #Do tags contain 'Ebony'? = Y
        And match response.tags contains 'Ebony'
        #Do tags NOT contain 'Ebony2'? = Y
        And match response.tags !contains 'Ebony2' 
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
        #Are there '500' articles? = N
        And match response.articlesCount == 500