class Question
  attr_reader :first_num, :second_num, :answer

  def initialize
    @first_num = rand(1..10)
    @second_num = rand(1...10)
    @answer = @first_num + @second_num
  end
end