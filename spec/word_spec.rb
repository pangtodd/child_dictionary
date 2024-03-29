require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe('.all')do
    it("returns an empty array when there are no words")do
      expect(Word.all).to eq([])
    end
  end
  describe('#save')do
    it("saves a word")do
      word = Word.new("frog", nil)
      word.save()
      word2 = Word.new("dog", nil)
      word2.save()
      expect(Word.all).to eq([word, word2])
    end
  end
  describe('#==')do
    it("is the same word if it has the same attributes as another word")do
      word = Word.new("hog", nil)
      word2 = Word.new("hog", nil)
      expect(word).to eq(word2)
    end
  end
  describe('.clear') do
    it("clears all words") do
      word = Word.new("frog", nil)
      word.save()
      word2 = Word.new("dog", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to eq([])
    end
  end
  describe('.find')do
    it("finds a word by id")do
      word = Word.new("frog", nil)
      word.save()
      word2 = Word.new("dog", nil)
      word2.save()
      expect(Word.find(word.id)).to eq(word)
    end
  end
  describe('#update')do
    it("updates and word by id")do
      word = Word.new("frog", nil)
      word.save()
      word.update("toad")
      expect(word.name).to eq("toad")
    end
  end
  describe('#delete')do
    it("deletes a word by id")do
      word = Word.new("frog", nil)
      word.save()
      word2 = Word.new("dog", nil)
      word2.save()
      word.delete()
      expect(Word.all).to eq ([word2])
    end
  end
  describe('#definitions') do
  it("returns a word's definitions") do
    Definition.clear()
      word = Word.new("Shark", nil)
      word.save()
      definition = Definition.new("aquatic animal", word.id, nil)
      definition.save()
      definition2 = Definition.new("big fish", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end
end