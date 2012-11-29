module Toadie
  class ExtractTodos
    def self.execute
      if Toadie.test?
        Toadie::FakeResults.extract_todos
      else
        IO.popen("grep TODO -rn --include=\*.{rb,erb,haml,slim,feature} #{Toadie.root}").readlines
      end
    end

    # Expected input format is: file:line:information
    def self.split_result(value)
      value.split(':', 3)
    end
  end
end