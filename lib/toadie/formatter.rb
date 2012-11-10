module Toadie
  class Formatter
    def self.format(scope)
      puts Slim::Template.new('views/report.slim').render(scope)
    end
  end
end
