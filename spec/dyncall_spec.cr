require "./spec_helper"

class Todo
  share :hello, :world

  def hello(args)
    args[:text]
  end

  def world(args)
    "world"
  end
end

describe Dyncall do
  it "has true shareds" do
    todo = Todo.new
    Todo.shared.should eq [:hello, :world]
  end

  it "static calls" do
    todo = Todo.new
    todo.hello({text: "world"}).should eq "world"
  end

  it "dynamic calls" do
    todo = Todo.new
    todo.call(:hello, {text: "world"}).should eq "world"
    todo.call(:world).should eq "world"
  end

  it "calls by string" do
    todo = Todo.new
    todo.call("world").should eq "world"
  end
end
