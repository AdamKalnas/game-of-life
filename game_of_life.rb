class GameOfLife
  def evolve(world)
    return evolve_single_line_only(world) unless world.respond_to? :each

    newWorld = []
    for line in world do
      newLine = ''
      for c in line.split('') do
        newLine << '.'
      end
      newWorld << newLine
    end
    newWorld
  end

  def getNumberOfNeighbors(neighbors)
    neighbors.count('*')
  end

  def gatherNeighbors(row,column, board)
   topLeft = rowAboveExists?(row) && columnToTheLeftExists?(column) ? board[row-1][column] : ''
   topMid = rowAboveExists?(row) ? board[row-1][column] : ''
   topRight = rowAboveExists?(row) && columnToTheRightExists?(board,column) ? board[row-1][column+1] : ''

   midLeft = columnToTheLeftExists?(column) ? board[row][column-1] : ''
   midRight = columnToTheRightExists?(board,column) ? board[row][column+1] : ''

   botLeft = rowBelowExists?(board, row) && columnToTheLeftExists?(column) ? board[row+1][column] : ''
   botMid = rowBelowExists?(board,row) ? board[row+1][column] : ''
   botRight = rowBelowExists?(board,row) && columnToTheRightExists?(board,column) ? board[row+1][column+1] : ''

   topLeft + topMid + topRight + midLeft + midRight + botLeft + botMid + botRight
  end

  private
  def evolve_single_line_only(world)
    '.' * world.length
  end

  def rowAboveExists?(row)
    row-1 >= 0
  end

  def rowBelowExists?(board, row)
    board.count >= row+2
  end

  def columnToTheLeftExists?(column)
    column -1 >= 0
  end

  def columnToTheRightExists?(board, column)
    board[0].length >= column + 2
  end
end
