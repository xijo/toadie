module Toadie
  class Blame
    attr_accessor :content

    def initialize(file, line)
      self.content = IO.popen("git blame -p #{file} -L#{line},#{line}").read
    end

    def author
      content and content.match(/author (.*)/)[1]
    end

    def author_email
      content and content.match(/author-mail (.*)/)[1]
    end
  end
end