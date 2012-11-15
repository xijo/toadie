module Toadie
  class Author
    @@authors = []

    attr_accessor :name, :nicknames, :emails

    def self.find_or_create(email, opts = {})
      find_by_email(email) || create(opts.merge(emails: [email]))
    end

    def self.find_by_email(email)
      @@authors.find { |author| author.emails.include?(email) }
    end

    def self.create(opts = {})
      opts.keys.each do |key|
        key.is_a?(String) and opts[key.to_sym] = opts.delete(key)
      end
      raise MissingEmail if opts[:emails].nil? || opts[:emails].empty?
      opts[:nicknames] ||= []
      @@authors << author = Author.new(opts)
      author
    end

    def self.all
      @@authors
    end

    def self.destroy_all
      @@authors.clear
    end

    def initialize(params = {})
      params.each { |key, value| __send__("#{key}=", value) }
    end

    def identifier
      @identifier ||= emails.first.downcase.gsub(/\W/, '')
    end

    def to_s
      name || nicknames.first || emails.first
    end
  end
end