require_relative 'game_of_life'

describe GameOfLife, 'evolve' do
  let(:blankSmallBoard) do
    ['......',
     '......',
     '......']
  end

  context 'when determining fate' do
    context 'when the cell is alive' do
      let(:cell) { '*' }

      it 'should die because of underpopulation if it has less than 2 neighbors' do
       subject.determineFate(cell, '*......').should eq('.') 
      end

      it 'should live on if it has 2 or 3 neighbors' do
       subject.determineFate(cell, '**......').should eq('*') 
       subject.determineFate(cell, '***.....').should eq('*') 
      end

      it 'should die if it has more than 3 neighbors' do
        subject.determineFate(cell, '****....').should eq('.')
      end
    end
    context 'when the cell is dead' do
      let(:cell) { '.' }

      it 'should become alive if it has exactly three neighbors' do
       subject.determineFate(cell, '***.....').should eq('*') 
      end
    end
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

    it 'lives if it has 3 neighbors' do
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

    it 'should find 3 neighbors when a cell is in the top right tcorner' do
      subject.gatherNeighbors(0,0, blankSmallBoard).should eq('...')
    end

    it 'should find 3 neighbors when a cell is in the top left corner' do
      subject.gatherNeighbors(0,5, blankSmallBoard).should eq('...')
    end

    it 'should find 3 neighbors when a cell is in the bottom left corner' do
      subject.gatherNeighbors(2,0, blankSmallBoard).should eq('...')
    end
    it 'should find 3 neighbors when a cell is in the bottom right corner' do
      subject.gatherNeighbors(2,5, blankSmallBoard).should eq('...')
    end
  end

end
