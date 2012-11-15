module Toadie
  class FakeResults
    def self.blame
      <<-EOS
1337 1 1 4
author Beverly Crusher
author-mail <crusher@uss-enterprise.com>
author-time 1352532060
author-tz +0100
committer Worf
committer-mail <worf@uss-enterprise.com>
committer-time 1352532060
committer-tz +0100
summary Initial commit.
      EOS
    end

    def self.extract_todos
      [
        'fakefile:42:# TODO geordi Refactor warp engine',
        'fakefile:666:# TODO no1 Clean up the bridge'
      ]
    end
  end
end