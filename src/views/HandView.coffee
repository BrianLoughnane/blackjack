class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2><span class="center"></span>'

  initialize: ->
    # on ('bust', )
    # @collection.on 'bust', =>
    #   debugger
    #   @render(true)
    @collection.on 'add remove change', =>
      @render()
    @render()

  render: (bust) ->

    @$el.children().detach()
    @$el.html @template @collection
    @$('.center').append @collection.map (card) ->
      new CardView(model: card).$el

    if @collection.scores()[0] isnt @collection.scores()[1] and @collection.scores()[1] < 22
      aceScores = @collection.scores()[0] + "/" + @collection.scores()[1]
      @$('.score').text aceScores
    else
      @$('.score').text @collection.scores()[0]

    if @collection.scores()[0] > 21
      @$('.score').text 'BUSTED!'
      @collection.busted()
