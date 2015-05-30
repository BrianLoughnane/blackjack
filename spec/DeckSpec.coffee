assert = chai.assert

describe 'deck of player', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck to the player', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().models[2]
      assert.strictEqual deck.length, 49

describe 'deck of dealer', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck to the dealer', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().models[2]
      assert.strictEqual deck.length, 49
    # it 'should hit if the minscore is < 17 and the maxscore < 18', ->
