require "./spec_helper"

class Todo
  share :hello, :world

  def self.hello(args)
    args[0]
  end

  def self.world(args)
    "world"
  end
end

describe Dyncall do
  it "has true shareds" do
    Todo.shared.should eq [:hello, :world]
  end

  it "static calls" do
    Todo.hello(["world"]).should eq "world"
  end

  it "dynamic calls" do
    Todo.call(:hello, ["world"]).should eq "world"
    Todo.call(:world).should eq "world"
  end

  it "calls by string" do
    Todo.call("world").should eq "world"
  end
end
