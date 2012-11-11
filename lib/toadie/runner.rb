module Toadie
  class Runner
    def self.run
      results = IO.popen('grep TODO -rn --include=\*.{rb,haml,erb,feature} .').readlines
      list = Todolist.new(results)

      Report.publish(list)
    end
  end
end
