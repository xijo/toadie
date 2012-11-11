module Toadie
  class Blame
    attr_accessor :content, :author

    def initialize(file, line)
      self.content = IO.popen("git blame -p #{file} -L#{line},#{line}").read
      if content
        self.author = Author.find(
          content.match(/author-mail <(.*)>/)[1],
          :name  => content.match(/author (.*)/)[1]
        )
      end
    end
  end
end