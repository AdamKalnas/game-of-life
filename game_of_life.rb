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
    rowAbove = board[row-1][column] + board[row-1][column +1] + board[row-1][column+1]
    currentRow = board[row][column-1] + board[row][column-1]
    rowBelow = board[row+1][column] + board[row+1][column +1] + board[row+1][column+1]
    rowAbove + currentRow + rowBelow
  end

  private
  def evolve_single_line_only(world)
    '.' * world.length
  end
end
