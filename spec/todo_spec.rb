require 'spec_helper'

describe Toadie::Todo do
  let(:todo) { Toadie::Todo.new('fakefile', 42, 'TODO text') }

  describe "#initialize" do
    it "assigns the given attributes" do
      todo.file.should == 'fakefile'
      todo.line.should == 42
      todo.text.should == 'TODO text'
    end

    it "converts provided input into string without failing" do
      todo = Toadie::Todo.new('fakefile', 42, self.class)
      todo.text.should be_a String
    end
  end

  it "finds reassignment if present" do
    picard  = Toadie::Author.create(emails: ['picard@uss-enterprise.com'], nicknames: ['captain', 'jean-luc'])
    todo    = Toadie::Todo.new('fakefile', 42, 'TODO jean-luc go to the doctor!')
    crusher = Toadie::Author.find_by_email('crusher@uss-enterprise.com') # created by fake blame

    todo.author.should      == crusher
    todo.responsible.should == picard
    todo.should be_reassigned
  end

  describe "#to_s" do
    it "returns the text is present" do
      todo.to_s.should == todo.text
    end

    it "returns a no-text message otherwise" do
      todo.text = ''
      todo.to_s.should == '<no content>'
    end
  end
end