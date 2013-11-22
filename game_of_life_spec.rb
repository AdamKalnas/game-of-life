require_relative 'game_of_life'

describe GameOfLife, 'evolve' do
  context 'when evauluating evolutions on a single line' do
    it 'doesnt produce any new life when everything is dead' do
      subject.evolve('.....').should eq('.....')
    end
    it 'it causes cells to die when there is an underpopulation' do
      subject.evolve('**...').should eq('.....')
    end
  end

  context 'when evaluating evolutions on multiple lines' do
    let(:blankSmallBoard) do
      ['......',
       '......',
       '......']
    end

    it 'doesnt produce any new life when everything is dead' do
      subject.evolve(blankSmallBoard).should eq(blankSmallBoard)
    end

    it 'doesnt produce any new when underpopulated' do
      board = ['*....*',
               '......',
               '..*...']
      subject.evolve(board).should eq(blankSmallBoard)
    end
    xit 'lives if it has 3 neighbors' do
      board = ['......',
               '..**..',
               '..**..']
      subject.evolve(board).should eq(board)
    end
  end
end
