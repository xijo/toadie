module Toadie
  class Todolist
    attr_accessor :todos

    def initialize(raw_todos)
      self.todos = raw_todos.map { |opts| Todo.new(*opts) }
    end

    def grouped
      @grouped ||= Hash[todos.group_by(&:responsible).sort_by { |k, v| -v.size }]
    end

    def size
      todos.size
    end
  end
end