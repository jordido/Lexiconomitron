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

private

  def eater (string)
    return nil unless string.is_a? String
    string.gsub(/[tT]/,'')
  end 
end

# Test 1
def test_method(method, input, output, testnumber)
  text = Lexiconomitron.new.method(method).call(input)
  if text == output
    p "OK test #{testnumber}"
  else
    p "FAIL test #{testnumber}, instead received #{text}"
  end
end

# Test 1
test_method(:eater, "astmmT  123","asmm  123",1)
test_method(:eater, "","",2)
test_method(:eater, 3,nil,3)
test_method(:eater, "asfdshhj","asfdshhj",4)
test_method(:shazam,["uno","dos","tres", "", 2343],["onu","sod","ser", "", ""],5)
test_method(:shazam,[],[],6)
test_method(:oompa_loompa,["qwerty", "pe", "2344t", "lolt"],[ "pe", "lol"],7)
test_method(:oompa_loompa,["", 45, "2344t", "lolt"],[ "", "lol"],8)
test_method(:oompa_loompa,[],[],"mitest")
test_method(:oompa_loompa,"lolt",[],10)
  