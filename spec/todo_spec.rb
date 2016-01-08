require 'spec_helper'

describe Toadie::Todo do
  let(:todo) { Toadie::Todo.new('fakefile', 42, 'TODO text') }

  describe "#initialize" do
    it "assigns the given attributes" do
      expect(todo.file).to eq 'fakefile'
      expect(todo.line).to eq 42
      expect(todo.text).to eq 'TODO text'
    end

    it "converts provided input into string without failing" do
      todo = Toadie::Todo.new('fakefile', 42, self.class)
      expect(todo.text).to be_a String
    end
  end

  it "finds reassignment if present" do
    picard  = Toadie::Author.create(emails: ['picard@uss-enterprise.com'], nicknames: ['captain', 'jean-luc'])
    todo    = Toadie::Todo.new('fakefile', 42, 'TODO jean-luc go to the doctor!')
    crusher = Toadie::Author.find_by_email('crusher@uss-enterprise.com') # created by fake blame

    expect(todo.author).to eq crusher
    expect(todo.responsible).to eq picard
    expect(todo).to be_reassigned
  end

  describe "#to_s" do
    it "returns the text is present" do
      expect(todo.to_s).to eq todo.text
    end

    it "returns a no-text message otherwise" do
      todo.text = ''
      expect(todo.to_s).to eq '<no content>'
    end
  end
end
