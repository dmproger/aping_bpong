module RangeFunction
  RANGE = 1..100
  OUTPUT = $stdout

  ReplaceWithMessage = Class.new(Exception)
  DividedInto3 = Class.new(ReplaceWithMessage)
  DividedInto5 = Class.new(ReplaceWithMessage)
  DividedInto3And5 = Class.new(ReplaceWithMessage)

  MESSAGES = {
    DividedInto3 => 'APing',
    DividedInto5 => 'BPong',
    DividedInto3And5 => 'APingBPong'
  }

  module_function

  def call(range = RANGE)
    range.each { |num| OUTPUT.puts resolve(num) }
  end

  private_class_method def resolve(num)
    raise DividedInto3And5 if (num % 15).zero?
    raise DividedInto3 if (num % 3).zero?
    raise DividedInto5 if (num % 5).zero?
    num
  rescue ReplaceWithMessage => e
    MESSAGES[e.class]
  end
end

#
# RangeFunction.()
#
