require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("shark", nil)
    @word.save()
  end

  describe('#==')do
    it("is the same definition if it has the attributes as another definition")
      definition = Defintion.new("aquatic animal", @word.id, nil)
      definition2 = Definition.new("aquatic animal", @word.id, nil)
      expect(definition).to eq(definition2)
    end
  end
  describe('.all')do
    it("returns a list of all definitions")do
      definition 
    end
  end
  describe('.clear')do
    it("clears all definitions")do
      definition = Defintion.new("aquatic animal", @word.id, nil)
      definition.save()
      defintion2 = Definition.new("flying animal", @word.id, nil)
      definition2.save
      Definition.clear
      expect(Definition.all).to eq([])
    end
  end
  describe('#save')do
    it("saves a definition")do
      definition = Defintion.new("aquatic animal", @word.id, nil)
      definition.save()
      expect(Defintiton.all).to eq([song])
    end
  end
  describe('.find')do
    it("find a definition by id")do
      definition = Defintion.new("aquatic animal", @word.id, nil)
      definition.save()
      defintion2 = Definition.new("flying animal", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to eq(definition)
    end
  end
  describe('#update')do
    it("updates a definition by id")do
      defintion = Definition.new("flying animal", @word.id, nil)
      definition.save()
      definition.update("flying animal with feathers", @word.id)
      expect(definition.name).to eq("flying animal with feathers")
    end
  end
  describe('#delete')do
    it("deletes a definition by id")do
      definition = Defintion.new("aquatic animal", @word.id, nil)
      definition.save()
      defintion2 = Definition.new("flying animal", @word.id, nil)
      definition2.save()
      definition.delete
      expect(Definition.all).to eq([definition2])
    end
  end
end
