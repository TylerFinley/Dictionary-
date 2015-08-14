require("rspec")
require("dictionaries")
require("word")


describe(Dictionary) do

    before() do
      Dictionary.clear()
      @test_dictionary = Dictionary.new({:definition => "Tyler",})
      @test_dictionary.save()
    end

  describe("#definition") do
    it("checks if the dictionary is intialized via the definition") do
      expect(@test_dictionary.definition()).to(eq("Tyler"))
    end
  end

  describe(".clear") do
    it("clears dictionary entries") do
      # @test_dictionary.save()
      Dictionary.clear
      expect(Dictionary.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the dictionary definition") do
      # @test_dictionary.save()
      expect(Dictionary.all()).to(eq([@test_dictionary]))
    end
  end

  describe(".find") do
    it("finds a spesific dictionary in an array and returns dictionarys definition") do
      # @test_dictionary.save()
      expect(Dictionary.find(@test_dictionary.id())).to(eq(@test_dictionary))
    end
  end

  describe("#id") do
    it("gives each definition an id by entry into array") do
      # @test_Dictionary.save()
      expect(@test_dictionary.id()).to(eq(1))
    end
  end

  describe("#add_word") do
    it("ads an word-address from the Word-class to the word-array") do
      word = Word.new(:word_address => "h")
      @test_dictionary.add_word(word)
      expect(@test_dictionary.words()).to(eq([word]))
    end
  end

  describe("#delete")do
    it("removes one specific entrz from the @@Dictionarys array") do
      @test_dictionary.delete()
      expect(Dictionary.all()).to(eq([]))
    end
  end

end

describe(Word) do

  before() do
    Word.clear()
    @test_word = Word.new({:word_address => "none@no.one"})
    @test_word.save()
  end

  describe("#word") do
    it("returns the string of the entered word_adress") do
      expect(@test_word.word_address()).to(eq("none@no.one"))
    end
  end

  describe(".clear") do
    it("clears word entries") do
      Word.clear
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the word adress") do
      expect(Word.all()).to(eq([@test_word]))
    end
  end
  describe(".find") do
    it("finds a specific word in an array and returns Dictionarys word") do
      expect(Word.find(@test_word.id())).to(eq(@test_word))
    end
  end

  describe("#id") do
    it("gives each word_address an id by entry into array") do
      expect(@test_word.id()).to(eq(1))
    end
  end
end
