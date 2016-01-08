require 'spec_helper'

describe Toadie::Todolist do
  let(:todolist) do
    Toadie::Todolist.new([
      ['fakefile', 42,  'Refactor warp engine'],
      ['fakefile', 666, 'Clean up the bridge']
    ])
  end

  it "builds Todos for the input data" do
    expect(todolist.size).to eq todolist.todos.size
    expect(todolist.size).to eq 2
    expect(todolist.todos.first).to be_a Toadie::Todo
    expect(todolist.todos.last).to  be_a Toadie::Todo
  end

  it "groups todos by responsible author" do
    responsible = todolist.todos.first.responsible
    grouped     = todolist.grouped

    expect(grouped).to be_a Hash
    expect(grouped).to have_key responsible
    expect(grouped[responsible]).to eq todolist.todos
  end
end
