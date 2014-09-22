class Lexiconomitron

  def shazam (array)
    return [] unless array.is_a? Array
    array.map do |word| 
      word.class == String ? eater(word.reverse) : ""
    end
  end

  def oompa_loompa (array)
    return [] unless array.is_a? Array
    (array.map do |word| 
      new_word = eater(word)
      new_word.class == String && new_word.length <= 3 ? new_word : nil
    end).compact
  end

  def eater (string)
    return nil unless string.is_a? String
    string.gsub(/[tT]/,'')
  end 
end

# Test 1

text = Lexiconomitron.new.eater("astmmT  123")

if text == "asmm  123"
  p "OK test 1"
else
  p "FAIL test 1, instead received #{text}"
end

# Test 2

text = Lexiconomitron.new.eater("")

if text == ""
  p "OK test 2"
else
  p "FAIL test 2, instead received #{text}"
end

#Test 3

text = Lexiconomitron.new.eater(3)

if text == nil
  p "OK test 3"
else
  p "FAIL test 3, instead received #{text}"
end

#Test 3.b
text = Lexiconomitron.new.eater("asfdshhj")

if text == "asfdshhj"
  p "OK test 3.b"
else
  p "FAIL test 3.b, instead received #{text}"
end

#Test 4

text = Lexiconomitron.new.shazam(["uno","dos","tres", "", 2343])

if text == ["onu","sod","ser", "", ""]
  p "OK test 4"
else
  p "FAIL test 4, instead received #{text}"
end

#Test 5

text = Lexiconomitron.new.shazam([])

if text == []
  p "OK test 5"
else
  p "FAIL test 5, instead received #{text}"
end

#Test 6

text = Lexiconomitron.new.shazam("rttjkshdf")

if text == []
  p "OK test 6"
else
  p "FAIL test 6, instead received #{text}"
end

#Test 7

text = Lexiconomitron.new.oompa_loompa(["qwerty", "pe", "2344t", "lolt"])

if text == [ "pe", "lol"]
  p "OK test 7"
else
  p "FAIL test 7, instead received #{text}"
end

#Test 8

text = Lexiconomitron.new.oompa_loompa(["", 45, "2344t", "lolt"])

if text == [ "", "lol"]
  p "OK test 8"
else
  p "FAIL test 8, instead received #{text}"
end

#Test 9

text = Lexiconomitron.new.oompa_loompa([])

if text == []
  p "OK test 9"
else
  p "FAIL test 9, instead received #{text}"
end

#Test 10

text = Lexiconomitron.new.oompa_loompa( "lolt")

if text == []
  p "OK test 10"
else
  p "FAIL test 10, instead received #{text}"
end
