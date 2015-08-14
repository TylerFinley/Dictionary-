class Word
  attr_reader(:word_address, :word_info)
  @@words = []

  define_method(:initialize) do |attributes|
    @word_address = attributes.fetch(:word_address)
    @word_id = @@words.length().+(1)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:id) do
    @word_id
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id() == identification.to_i
        found_word = word
      end
    end
    found_word
  end

end
