# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()

    @set 'game', game = new GameModel()

# Add listener for game completion and reset deck playerhand and dealerhand
# GameMode
