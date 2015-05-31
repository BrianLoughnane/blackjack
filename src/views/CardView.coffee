class window.CardView extends Backbone.View
  className: 'card'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.addClass 'covered' unless @model.get 'revealed'
    if @model.get 'revealed'
      @$el.css 'background-image', 'url("img/cards/' + this.model.attributes.rankName.toString().toLowerCase() + '-' + this.model.attributes.suitName.toLowerCase() + '.png")'

