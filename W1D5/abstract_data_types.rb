require 'byebug'

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.unshift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    kvpair_idx = @map.index {|kvpair| kvpair[0] == key}
    if kvpair_idx
      @map[kvpair_idx][1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each {|kvpair| kvpair[1] if kvpair[0] == key}
    nil
  end

  def remove(key)
    @map.reject! {|kvpair| pair[0] == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end
