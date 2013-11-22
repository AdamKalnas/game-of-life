class GameOfLife
  def evolve(world)
    return world unless world.respond_to? :each

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
end
