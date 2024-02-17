Feature: History Service

    # Service
    Scenario: Obter histórico de um usuário por id
        Given o método getUserHistory chamado com "1" do HistoryService retorna um histórico com "3" itens com song_id "1", "2" e "3"
        When o método getUserHistory do HistoryService for chamado com o id "1"
        Then o histórico retornado deve ter "3" itens com song_id "1", "2" e "3"

    Scenario: Add a new song to a user history
        Given the function createHistory was called with the user_id "1" and the song_id "4"
        When the function getUserHistory is called with the user_id "1"
        Then the history returned must have "1" item with song_id "4"

    Scenario: Delete an entry from a user history
        Given the user with id "1" has 3 history entries
        When the function deleteHistory is called on one of the entry ids
        And the function getUserHistory is called with the user_id "1"
        Then the history returned must not have the entry that was deleted
        And the user history must have 2 entries

    Scenario: Clear user history
        Given the user with id "1" has 3 history entries
        When the function deleteUserHistory is called with the user_id "1"
        And the function getUserHistory is called with the user_id "1"
        Then the history returned must have 0 items

    Scenario: Get user statistics
        Given the user with id "1" has a history with the following items:
            | times_played | song_id | title                   | artist      | genre | duration |
            | 3            | 1       | Never Gonna Give You Up | Rick Astley | Rock  | 300      |
            | 1            | 2       | Yellow Submarine        | The Beatles | Rock  | 100      |
        When the function getUserStatistics is called with the user_id "1"
        Then it must return the following statistics:
            | most_played_song        | most_played_genre | play_duration |
            | Never Gonna Give You Up | Rock              | 1000          |

    Scenario: History Tracking disabled
        Given the user with id "1" has history tracking disabled
        And the user has no play history
        When the function createHistory is called with the user_id "1" and the song_id "4"
        And the function getUserHistory is called with the user_id "1"
        Then the history returned must have 0 items