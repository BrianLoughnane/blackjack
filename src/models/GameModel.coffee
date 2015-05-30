# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.

class window.GameModel extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get 'playerHand'
      .on 'bust stand', =>
        @get 'dealerHand'
          .at 0
            .flip()
        @get 'dealerHand'
          .stand()
        #trigger end event (heard by gameview)

      .on 'stand', =>
        score = @get 'dealerHand'
          .scores()[0]

        if score < 17
          @get 'dealerHand'
            .hit()
        else if score > 21
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
