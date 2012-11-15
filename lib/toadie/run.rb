module Toadie
  class Run
    def start
      results = ExtractTodos.execute
      results = results.map { |result| ExtractTodos.split_result(result) }
      list    = Todolist.new(results)

      Report.publish(list)
    end
  end
end
