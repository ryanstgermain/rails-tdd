require_relative '../lib/bowling_game'

describe BowlingGame do
    let(:game) { BowlingGame.new }
    it 'scores a gutter game' do
        game.pins([0] * 20)
        expect(game.score).to eq(0)
    end

    it 'scores a game of 1s' do
        game.pins([1] * 20)
        expect(game.score).to eq(20)
    end

    it 'scores a game with a spare' do
        pending
        game.pins([4,5,6] + [0] * 17)
        expect(game.score).to eq(20)
    end
end
