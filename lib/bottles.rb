require "active_support/all"

class BottleNumber < Struct.new(:number)
  def self.for(number)
    ("BottleNumber#{number}".safe_constantize || BottleNumber).new(number)
  end

  def to_s = "#{quantity} #{container}"
  def container = "bottles"
  def pronoun = "one"
  def quantity = number.to_s
  def successor = BottleNumber.for(number - 1)
  def action = "Take #{pronoun} down and pass it around"
end

class BottleNumber0 < BottleNumber
  def quantity = "no more"
  def successor = BottleNumber.for(99)
  def action = "Go to the store and buy some more"
end

class BottleNumber1 < BottleNumber
  def container = "bottle"
  def pronoun = "it"
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
