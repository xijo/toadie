require 'spec_helper'

describe Toadie::Blame do
  it "builds a author on initialize" do
    expect {
      blame = Toadie::Blame.new('fakefile', 42)
      expect(blame.author).to be_a(Toadie::Author)
    }.to change { Toadie::Author.all.size }.by(1)
  end

  describe "#execute" do
    it "returns test results in test mode" do
      expect(Toadie::Blame.execute('fakefile', 42)).to eq Toadie::FakeResults.blame
    end
  end

  describe "#extract_name_and_email" do
    it "gets name and email correctly from a blame porcelain result" do
      result       = Toadie::FakeResults.blame
      name, email  = Toadie::Blame.extract_author(result)
      expect(name).to eq 'Beverly Crusher'
      expect(email).to eq 'crusher@uss-enterprise.com'
    end
  end
end
