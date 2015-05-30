assert = chai.assert

describe 'when dealer hits and has an ace', ->
  game = null
  maxScore = null
  minScore = null

  beforeEach ->
    game = new GameModel()
    while game.attributes.dealerHand.models[0].attributes.rankName != 'Ace' or game.attributes.dealerHand.models[1].attributes.rankName != 'Ace'
      game = new GameModel()
    # game.attributes.playerHand.stand()
    game.get 'playerHand'
      .stand()
      ####
    maxScore = game.attributes.dealerHand.scores()[1]
    minScore = game.attributes.dealerHand.scores()[0]

  describe 'max score < 18', ->
    it 'dealer should hit', ->
      assert.strictEqual maxScore > 17, true
      assert.strictEqual maxScore, 1

describe 'when dealer hits and has an ace', ->
  game = null
  maxScore = null
  minScore = null
  findGame = null
  rank0 = null
  rank1 = null

  beforeEach ->
    findGame = ->
      game = new GameModel()
      game.get 'playerHand'
        .stand()
      maxScore = game.attributes.dealerHand.scores()[1]
      minScore = game.attributes.dealerHand.scores()[0]
      rank0 = game.attributes.dealerHand.models[0].attributes.rankName
      rank1 = game.attributes.dealerHand.models[1].attributes.rankName
      if rank0 isnt 'Ace' or rank1 isnt 'Ace' or maxScore < 22
        findGame()
      else
        game
    findGame()

  describe 'if max score > 21', ->
    it 'dealer should hit if minScore < 16', ->
      assert.strictEqual minScore, 1
      assert.strictEqual minScore > 16, true





