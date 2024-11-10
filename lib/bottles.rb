require "active_support/all"

class BottleNumber < Struct.new(:number)
  def self.for(number) = ("BottleNumber#{number}".safe_constantize || BottleNumber).new(number)

  def action = "Take #{pronoun} down and pass it around"
  def successor = BottleNumber.for(number - 1)
  def quantity = number.to_s
  def container = "bottles"
  def pronoun = "one"
  def to_s = "#{quantity} #{container}"
end

class BottleNumber0 < BottleNumber
  def action = "Go to the store and buy some more"
  def successor = BottleNumber.for(99)
  def quantity = "no more"
end

class BottleNumber1 < BottleNumber
  def container = "bottle"
  def pronoun = "it"
end

class Bottles
  def song = verses(99, 0)
  def verses(first, last) = first.downto(last).map { verse(_1) }.join("\n")

  def verse(number)
    number = BottleNumber.for(number)

    "#{number} of beer on the wall, #{number} of beer.\n".capitalize +
      "#{number.action}, #{number.successor} of beer on the wall.\n"
  end
end
