Feature: Contributors and Followers
    As an user currently on a playlist page
    I want to see a list of contributors and a list of followers of that playlist
    So that I can know users with similar tastes to me
    
    Scenario: Being owner of a playlist
        Given the user with login "Thiago" accesses the "Playlist Library" page
        When the "New Playlist+" field is selected
        And the name "AMV music" is entered
        And the option to make the playlist public is marked
        And the user confirms the creation
        Then any user that enters the "AMV music" playlist page can see the name "Thiago" listed as the owner, alongside some aditional information

    Scenario: Adding contributors to a playlist
        Given the user with login "Thiago" is the owner of the playlist "AMV music"
        And accesses the page of the playlist "AMV music"
        And the playlist "AMV music" is public
	When the user "Thiago" selects the field "add contributors"
	And sends an invite to the user with login "Otavio" to be a contributor
        And the user "Otavio" accepts the invite
	Then any user that enters the "AMV music" playlist page can see the name "Otavio" listed as contributor, alongside some aditional information

    Scenario: Declining invite to be a contributor
        Given the user with login "Thiago" is the owner of the playlist "AMV music"
        And accesses the page of the playlist "AMV music"
        And the playlist "AMV music" is public
        And the list of followers for the playlist "AMV music" is currently empty
	When the user "Thiago" selects the field "add contributors"
	And sends an invite to the user with login "Otavio" to be a contributor
        And the user "Otavio" doesn't accept the invite
	Then any user that enters the "AMV music" playlist page will see the list of contributors as empty

    Scenario: Following a playlist
        Given the user with login "Thiago" is currently on the page of the playlist "Shrek soundtrack"
        And the user "Thiago" is not the owner of the playlist "Shrek soundtrack"
        And the playlist "Shrek soundtrack" is public
        When the "follow" field is selected
        Then any user that enter the "Shrek soundtrack" playlist page can see the name "Thiago" listed as follower

    Scenario: Failure in following a playlist as its owner
        Given the user with login "Thiago" is the owner of the playlist "AMV music"
        And accesses the page of the playlist "AMV music"
        When the "follow" field is selected
        Then an error message will be displayed, warning the owner can't follow their own playlist

    Scenario: Accessing the owner's profile page from the playlist page
        Given the user with login "Thiago" is currently on the page of the playlist "Shrek soundtrack"
        And the user "Otavio" is listed as the owner of that playlist
        When the user "Thiago" selects the name of the owner
	Then the user "Thiago" will end up in the profile page for user "Otavio"

    Scenario: Accessing the profile page of a contributor from the playlist page
        Given the user with login "Thiago" is currently on the page of the playlist "Shrek soundtrack"
        And the user "Pedro" is listed as one of the contributors of that playlist
        When the user "Thiago" selects the name of the user "Pedro" in the list of contributors
	Then the user "Thiago" will end up in the profile page for user "Pedro"

    Scenario: Accessing the profile page of a follower from the playlist page
        Given the user with login "Thiago" is currently on the page of the playlist "Shrek soundtrack"
        And the user "Luan" is listed as one of the followers of that playlist
        When the user "Thiago" selects the name of the user "Luan" in the list of followers
	Then the user "Thiago" will end up in the profile page for user "Luan"
 
        