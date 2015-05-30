# Determines game start and game end (winning and losing)
class window.App extends Backbone.Model
  initialize: ->
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()

    @set 'game', game = new GameModel()

# Add listener for game completion and reset deck playerhand and dealerhand
# GameMode
