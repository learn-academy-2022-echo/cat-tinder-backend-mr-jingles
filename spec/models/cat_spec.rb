require 'rails_helper'

RSpec.describe Cat, type: :model do
 it 'should validate name' do
  cat = Cat.create
  expect(cat.errors[:name]).to_not be_empty
 end
 it 'should validate age' do
    cat = Cat.create
    expect(cat.errors[:age]).to_not be_empty
   end
it 'should validate emjoys' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
   end
   it 'should validate image' do
    cat = Cat.create
    expect(cat.errors[:image]).to_not be_empty
   end
   it 'should validate number of characters in enjoys to at least 10 characters long' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
   end
end
