class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # name = if @isDealer then 'DealerHandCollection' else 'PlayerHandCollection'
    # @set 'name', name
    @dealer = !!@isDealer

  hit: ->
    @add(@deck.pop())
    @trigger 'hit', @

  stand: ->
    @trigger 'stand', @

    if @dealer
      @end()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    # find out if bust,
    # if so, emit 'bust' event
    [@minScore(), @minScore() + 10 * @hasAce()]

  busted: ->
    @trigger 'bust' , @

    if @dealer
      @end()

  end: ->
    @trigger 'end', @


