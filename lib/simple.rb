module Simple
  RANGE = 1..100
  OUTPUT = $stdout

  module_function

  def call
    RANGE.each do |n|
      OUTPUT.puts (s = "#{(n % 3).zero? ? 'APing' : ''}#{(n % 5).zero? ? 'BPong' : ''}").empty? ? n : s
    end
  end
end
