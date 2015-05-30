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

    # Add listener for game completion and reset deck playerhand and dealerhand
    # GameModel?
