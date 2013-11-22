require_relative 'game_of_life'

describe GameOfLife, 'evolve' do
  it 'does stuff' do
  game = GameOfLife.new
  game.evolve('.....').should eq('.....')
  end
end
