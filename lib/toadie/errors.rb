module Toadie
  class Error < StandardError; end

  class Author
    class MissingEmail < Toadie::Error; end
  end
end