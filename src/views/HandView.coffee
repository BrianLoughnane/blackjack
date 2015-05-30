class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

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
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    if @collection.scores()[0] > 21
      @$('.score').text 'BUSTED!'
      @collection.busted()
    @collection

