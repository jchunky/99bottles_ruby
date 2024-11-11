require "active_support/all"

class BottleNumber < Struct.new(:number)
  def self.for(number)
    ("BottleNumber#{number}".safe_constantize || BottleNumber).new(number)
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def to_s
    "#{quantity} #{container}"
  end
end

class BottleNumber0 < BottleNumber
  def action
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map { verse(_1) }.join("\n")
  end

  def verse(number)
    number = BottleNumber.for(number)

    "#{number} of beer on the wall, #{number} of beer.\n".capitalize +
      "#{number.action}, #{number.successor} of beer on the wall.\n"
  end
end
