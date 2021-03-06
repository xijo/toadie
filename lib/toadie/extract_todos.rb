module Toadie
  class ExtractTodos
    def self.execute
      if Toadie.test?
        Toadie::FakeResults.extract_todos
      else
        grep_includes = Toadie.file_extensions.inject('') { |m, ex| m + "--include=*.#{ex} " }
        marker_regexp = Toadie.todo_markers * '|'
        IO.popen("egrep \"#{marker_regexp}\" -rn #{grep_includes} #{Toadie.root}").readlines
      end
    end

    # Expected input format is: file:line:information
    def self.split_result(value)
      value.split(':', 3)
    end
  end
end
