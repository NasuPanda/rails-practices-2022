json.extract! @book, :id, :name, :price
json.name_with_id "#{@book.id} - #{@book.name}"