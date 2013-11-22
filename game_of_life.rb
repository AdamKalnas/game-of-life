class GameOfLife
  def evolve(world)
    return evolve_single_line_only(world) unless world.respond_to? :each

    newWorld = []
    world.each do |line|
      newWorldLine = ''
      line.each_char do |c|
        newWorldLine << '.'
      end
      newWorld << newWorldLine
    end
    newWorld
  end

  private
  def evolve_single_line_only(world)
    '.' * world.length
  end
end
