class Bottles
  def song
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map { verse(_1) }.join("\n")
  end

  def verse(number)
    case number
    when 3..99 then "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    when 2 then "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 0 then "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
