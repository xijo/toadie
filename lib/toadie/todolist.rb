module Toadie
  class Todolist
    attr_accessor :todos

    def initialize(raw_todos)
      # raw format from blame is: file:line:information
      self.todos = raw_todos.map { |result| Todo.new(*result.split(':', 3)) }
    end

    def grouped
      @grouped ||= Hash[todos.group_by(&:responsible).sort_by { |k, v| -v.size }]
    end

    def size
      todos.size
    end
  end
end