module Toadie
  class Todo
    attr_accessor :file, :line, :text, :blame

    def initialize(file, line, text)
      self.file  = file
      self.line  = line
      self.text  = text.sub(/#\s*TODO/, '').strip
      self.blame = Blame.new(file, line)
    end

    def to_s
      text.nil? || text.empty? ? '<no content>' : text
    end

    def responsible
      assign || blame.author
    end

    def assigned_by
      blame.author if assign
    end

    def assign # way to often..
      @assign ||= Author.all.find { |author|
        author.nicknames.any? { |nickname| text.include?(nickname) }
      }
      # nil # TODO implement me
    end
  end
end