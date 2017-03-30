require 'rails_helper'
RSpec.describe Character, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should not save if first_name, last_name, or workplace field is blank" do
      @char = Character.new(
            first_name: '',
            last_name: 'chang',
            workplace: 'schang@codingdojo.com'
        )
      expect(@char).to be_invalid
      @char.last_name=''
      @char.first_name='Leo'
      expect(@char).to be_invalid
      @char.last_name='Chang'
      @char.workplace=''
      expect(@char).to be_invalid
  end
  it 'should not allow duplicate characters based on first, last names' do
    Character.create(first_name:"Bart",last_name:"Simpson",workplace:"Springfield Elementary")
    @char=Character.new(first_name:"Bart",last_name:"Simpson",workplace:"Springfield Elementary")
    expect(@char.valid?).to be(false)
  end
  it 'should have a method "name" that returns the full name' do
    @char=Character.new(first_name:"Bart",last_name:"Simpson",workplace:"Springfield Elementary")
    expect(@char.name).to eq("Bart Simpson")
  end
end
