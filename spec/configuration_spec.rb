require 'spec_helper'

describe Toadie::Configuration do
  let(:config) { 'foo'.extend(Toadie::Configuration) }

  describe "#todo_markers" do
    it "returns default todo markers if nothing was provided" do
      expect(config.todo_markers).to eq Toadie.default_todo_markers
    end

    it "returns custom todo markers if provided" do
      config.todo_markers = [:foo, :bar]
      expect(config.todo_markers).to eq [:foo, :bar]
    end
  end
end
