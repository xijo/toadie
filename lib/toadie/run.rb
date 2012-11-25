module Toadie
  class Run
    def start
      started_at = Time.now
      results    = ExtractTodos.execute
      results    = results.map { |result| ExtractTodos.split_result(result) }
      list       = Todolist.new(results)

      Report.publish(list, started_at)
    end
  end
end
