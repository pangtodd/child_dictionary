require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'shark')
    click_on('Go!')
    expect(page).to have_content('shark')
  end
end

describe('create a edit word path', {:type => :feature}) do
  it('goes to the edit word page and changes a word') do
    word = Word.new("shark", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'Tiger Shark')
    click_on('Update')
    expect(page).to have_content('Tiger Shark')
  end
end

describe('create a delete word path', {:type => :feature}) do
  it('goes to the edit word page and and then deletes a word') do
    Word.clear()
    word = Word.new("shark", nil)
    word.save
    word2 = Word.new("panda",nil)
    word2.save
    visit("/words/#{word.id}/edit")
    click_on('Delete')
    expect(page).to have_no_content('shark')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition of a word') do
    word = Word.new("shark", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'big fish')
    click_on('Add definition')
    expect(page).to have_content('big fish')
  end
end

describe('create a edit definition path', {:type => :feature}) do
  it('goes to the edit word page and changes a word') do
    Word.clear()
    word = Word.new("shark", nil)
    word.save()
    definition= Definition.new("big fish", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("name", :with => 'sharp teeth')
    click_on('Update definition')
    expect(page).to have_content('sharp teeth')
  end
end

describe('create a delete definition path', {:type => :feature}) do
  it('goes to the edit definition page and and then deletes a definition') do
    Word.clear()
    word = Word.new("shark", nil)
    word.save()
    definition= Definition.new("big fish", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on('Delete definition')
    expect(page).to have_no_content('big fish')
  end
end
