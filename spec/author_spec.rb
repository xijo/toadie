require 'spec_helper'

describe Toadie::Author do
  let(:author) { Toadie::Author.new(name: 'Geordi LaForge', emails: ['Geordi@uss-enterprise.com'], nicknames: ['geordi', 'laforge']) }

  it "sets attributes on initialize" do
    expect(author.name).to eq 'Geordi LaForge'
    expect(author.emails).to eq ['Geordi@uss-enterprise.com']
    expect(author.nicknames).to eq ['geordi', 'laforge']
  end

  it "builds a identifier by using the email" do
    expect(author.identifier).to eq 'geordiussenterprisecom'
  end

  describe "#to_s" do
    it "uses the name attribute if present" do
      expect(author.to_s).to eq "Geordi LaForge"
    end

    it "uses a nickname if present" do
      author.name = nil
      expect(author.to_s).to eq 'geordi'
    end

    it "uses the email address finally" do
      author.name      = nil
      author.nicknames = []
      expect(author.to_s).to eq 'Geordi@uss-enterprise.com'
    end
  end

  describe "#find_by_email" do
    it "returns a author if it exists" do
      author = Toadie::Author.create(emails: ['androids@humanafterall.org', 'data@uss-enterprise.com'])
      expect(Toadie::Author.find_by_email('data@uss-enterprise.com')).to eq author
    end

    it "returns nil if no author was found" do
      expect(Toadie::Author.find_by_email('q@uss-enterprise.com')).to be_nil
    end
  end

  describe "#create" do
    it "assigns all attributes to the author" do
      author = Toadie::Author.create(emails: ['data@uss-enterprise.com'], name: 'Data', nicknames: ['data'])
      expect(author.name).to eq 'Data'
      expect(author.emails).to eq ['data@uss-enterprise.com']
      expect(author.nicknames).to eq ['data']
    end

    it "works with symbolized hash key" do
      expect {
        Toadie::Author.create(emails: ['Data@uss-enterprise.com'])
      }.to change { Toadie::Author.all.size }.by(1)
    end

    it "works with stringified hash key" do
      expect {
        Toadie::Author.create("emails" => ['Data@uss-enterprise.com'])
      }.to change { Toadie::Author.all.size }.by(1)
    end

    it "fails to create an author without email address" do
      expect {
        Toadie::Author.create
      }.to raise_error { Toadie::Author::MissingEmail }
    end
  end

  describe "#find_or_create" do
    it "returns a author if it was found" do
      author = Toadie::Author.create(emails: ['no1@uss-enterprise.com'])
      expect {
        expect(Toadie::Author.find_or_create('no1@uss-enterprise.com')).to eq author
      }.to_not change { Toadie::Author.all.size }
    end

    it "creates a author if it was not found" do
      expect {
        author = Toadie::Author.find_or_create('no1@uss-enterprise.com', name: 'William T. Riker', nicknames: ['riker', 'no1'])
        expect(author.emails).to eq ['no1@uss-enterprise.com']
        expect(author.name).to eq 'William T. Riker'
        expect(author.nicknames).to eq ['riker', 'no1']
      }.to change { Toadie::Author.all.size }.by(1)
    end
  end
end
