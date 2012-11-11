module Toadie
  class Todo
    attr_accessor :file, :line, :text, :blame

    def initialize(file, line, text)
      self.file  = file
      self.line  = line
      self.text  = text.to_s.sub(/#\s*TODO/, '').strip
      self.blame = Blame.new(file, line)
      @reassignment = find_reassignment
    end

    def to_s
      text.nil? || text.empty? ? '<no content>' : text
    end

    def reassigned?
      !!@reassignment
    end

    def responsible
      @reassignment || blame.author
    end

    def author
      blame.author
    end

    private

    def find_reassignment
      Author.all.find do |author|
        author.nicknames.any? { |nickname| text.include?(nickname) }
      end
    end
  end
end