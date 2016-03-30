require "./spec_helper"

class Todo
  share_class_methods :hello, :world, :sum
  share_instance_methods :bigger, :smaller, :bigger!

  def self.hello(args)
    args[0]
  end

  def self.world(args)
    "world"
  end

  def self.sum(args)
    args[0] + args[1]
  end

  getter word

  def initialize(@word)
  end

  def bigger(args)
    @word.upcase
  end

  def smaller(args)
    @word.downcase
  end

  def bigger!(args)
    @word = @word.upcase
  end
end

describe Dyncall do
  it "has true shareds" do
    Todo.shared.should eq [:hello, :world, :sum]
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

  it "can work with other types" do
    Todo.call(:sum, [1, 2]).should eq 3
  end

  it "calls instances" do
    todo = Todo.new("dYnCaLL")
    todo.call(:bigger).should eq "DYNCALL"
    todo.call(:smaller).should eq "dyncall"

    todo.word.should eq "dYnCaLL"
    todo.call(:bigger!)
    todo.word.should eq "DYNCALL"
  end
end
