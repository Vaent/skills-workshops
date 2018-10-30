
require 'library.rb'

describe Library do
  lib = Library.new
  it 'can return a list of all books' do
    expect(lib.list_books).to eq([
      {title: 'POODR', author: 'Sandi Metz', subject: 'OOP'},
      {title: 'Learn Ruby The Hard Way', author: 'Zed Shaw', subject: 'Ruby'},
      {title: 'Eloquent JavaScript', author: 'Marijn Haverbeke', subject: 'JS'},
      {title: 'The Well Grounded Rubyist', author: 'Sandi Metz', subject: 'Ruby'},
    ])
  end

  it 'can add a new book' do
    book = {title: 'A Great Title', author: 'I Wright', subject: 'Text'}
    lib.add_book(book)
    expect(lib.list_books).to include(book)
  end

  it 'can find a specific book' do
    expect(lib.find_book('POODR')).to eq({title: 'POODR', author: 'Sandi Metz', subject: 'OOP'})
    expect(lib.find_book('Not in library')).to eq(nil)
  end

  it 'can delete a book' do
    lib.remove_book('POODR')
    expect(lib.find_book('POODR')).to eq(nil)
  end

  it 'can return a list of all books by subject' do
    expect(lib.all_books_by_subject('Ruby')).to eq([{title: 'Learn Ruby The Hard Way', author: 'Zed Shaw', subject: 'Ruby'},{title: 'The Well Grounded Rubyist', author: 'Sandi Metz', subject: 'Ruby'}])
  end
end
