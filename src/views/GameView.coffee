# Model is GameModel
class  window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="gameEnd">You <span class="status"></span></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    # We could reset the model to App & do model.get('game').get('playerhand').hit()
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @model.get 'playerHand'
      .on 'bust stand', =>
        @$('button').hide()



    @model.on 'end', =>
      winStatus = 'win!'

      playerScore = @model.get 'playerHand'
        .scores()[0]

      if @model.get 'dealerHand'
        .scores()[0] > playerScore then winStatus = 'lose!'

      if playerScore > 21
        winStatus = 'lose!'

      @$('.status').text(winStatus)
      @$('.gameEnd').show()


    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

