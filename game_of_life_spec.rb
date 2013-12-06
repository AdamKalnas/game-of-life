require_relative 'game_of_life'

describe GameOfLife, 'evolve' do
  let(:blankSmallBoard) do
    ['......',
     '......',
     '......']
  end

  context 'when evauluating evolutions on a single line' do
    it 'doesnt produce any new life when everything is dead' do
      subject.evolve('.....').should eq('.....')
    end
    it 'it causes cells to die when there is an underpopulation' do
      subject.evolve('**...').should eq('.....')
    end
  end

  context 'when evaluating evolutions on multiple lines' do

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
               '..**..',
               '......' ]
      subject.evolve(board).should eq(board)
    end
  end

  context 'when determining how many neighbors' do
    it 'should find 3 neighbors' do
      subject.getNumberOfNeighbors('***.....').should eq(3)
    end
    it 'should find zero neighbors when there arent any' do
      subject.getNumberOfNeighbors('........').should eq(0)
    end
  end

  context 'when rounding up the neighbors' do
    it 'should should find 8 neighbors for a cell in the middle' do
      subject.gatherNeighbors(1,1,blankSmallBoard).should eq('........')
    end
  end
end
