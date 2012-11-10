module Toadie
  class Runner
    def self.run
      results = IO.popen('grep TODO -rn --include=\*.{rb,haml,erb,feature} .').readlines

      todos = results.map do |result|
        Todo.new(*result.split(':', 3))
      end

      grouped_todos = todos.group_by(&:author)

      grouped_todos.each do |author, todos|
        puts author
        puts todos.size
      end
    end
  end
end
