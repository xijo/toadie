module Toadie
  class Blame
    attr_accessor :content, :author

    def self.execute(file, line)
      if Toadie.test?
        Toadie::FakeResults.blame
      else
        IO.popen("git blame -p #{file} -L#{line},#{line}").read
      end
    end

    # Returns name and email of the commits author
    def self.extract_author(content)
      content =~ /author (.*)\n.*author-mail <(.*)>\n.*author-time/m
      return $1, $2
    end

    def initialize(file, line)
      self.content = Blame.execute(file, line)
      if content
        name, email = Blame.extract_author(content)
        self.author = Author.find_or_create(email, name: name)
      end
    end
  end
end