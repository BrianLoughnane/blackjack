# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.

class window.GameModel extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get 'playerHand'
      # Make Dealer flip if player busts or stands
      .on 'bust stand', =>
        @get 'dealerHand'
          .at 0
            .flip()

      # Dealer stands if player busts
      .on 'bust', =>
        @get 'dealerHand'
          .stand()
        #trigger end event (heard by gameview)

      #Player stands, Dealer hits or stands based on score
      .on 'stand', =>

        #Possible Dealer scores
        minScore = @get 'dealerHand'
          .scores()[0]
        maxScore = @get 'dealerHand'
          .scores()[1]
        hasAce = minScore isnt maxScore

        if not hasAce
          if minScore < 17
            @get 'dealerHand'
              .hit()
          else if minScore > 21
            @get 'dealerHand'
              .bust()
          else
            @get 'dealerHand'
              .stand()

        else if hasAce
          if minScore < 17 and maxScore < 18
            @get 'dealerHand'
              .hit()
          else if minScore > 21
            @get 'dealerHand'
              .bust()
          else
            @get 'dealerHand'
              .stand()

        #trigger end event (heard by gameview)
    @get 'dealerHand'
      .on 'end', =>
        @trigger 'end', @

    # Add listener for game completion and reset deck playerhand and dealerhand
    # GameModel?
