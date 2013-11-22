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

  private
  def evolve_single_line_only(world)
    '.' * world.length
  end
end
