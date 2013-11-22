require_relative 'game_of_life'

describe GameOfLife, 'evolve' do
  context 'when evauluating evolutions on a single line' do
    it 'doesnt produce any new life when everything is dead' do
      game = GameOfLife.new
      game.evolve('.....').should eq('.....')
    end
  end

  context 'when evaluating evolutions on two lines' do
    it 'doesnt produce any new life when evertying is dead' do
      game = GameOfLife.new
      blankSmallBoard = ['......','......']
      game.evolve(blankSmallBoard).should eq(blankSmallBoard)
    end
  end
end
