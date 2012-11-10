module Toadie
  class Todolist
    attr_accessor :todos

    def initialize(raw_todos)
      # raw format from blame is: file:line:information
      self.todos = raw_todos.map { |result| Todo.new(*result.split(':', 3)) }
    end

    def grouped
      todos.group_by(&:author)
    end
  end
end