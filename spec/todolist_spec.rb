require 'spec_helper'

describe Toadie::Todolist do
  let(:todolist) do
    Toadie::Todolist.new([
      ['fakefile', 42,  'Refactor warp engine'],
      ['fakefile', 666, 'Clean up the bridge']
    ])
  end

  it "builds Todos for the input data" do
    todolist.size.should == todolist.todos.size.should
    todolist.size.should == 2
    todolist.todos.first.should be_a Toadie::Todo
    todolist.todos.last.should  be_a Toadie::Todo
  end

  it "groups todos by responsible author" do
    responsible = todolist.todos.first.responsible
    grouped     = todolist.grouped

    grouped.should be_a Hash
    grouped.should have_key responsible
    grouped[responsible].should == todolist.todos
  end
end