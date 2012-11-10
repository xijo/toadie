module Toadie
  class Todo
    attr_accessor :file, :line, :text, :blame

    def initialize(file, line, text)
      self.file, self.line, self.text = file, line, text
      self.blame = Blame.new(file, line)
    end

    def to_s
      "A: #{author}, T: #{text}"
    end

    def author
      blame.author
    end
  end
end