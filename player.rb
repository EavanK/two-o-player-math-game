class Player
  attr_reader :name, :lives

  def initialize (name)
    @name = name
    @lives = 3
  end

  # if a player answers wrong, lose a life
  def wrong_answer
    @lives -= 1
  end
end