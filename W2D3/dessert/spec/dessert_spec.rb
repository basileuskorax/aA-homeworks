require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Jeff') }
  subject(:sweetcake) {Dessert.new('sweetcake', 300, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(sweetcake.type).to eq('sweetcake')
    end

    it "sets a quantity" do
      expect(sweetcake.quantity).to eq(300)
    end

    it "starts ingredients as an empty array" do
      expect(sweetcake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('MacBurger', 'eleven', 'Ronald')}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(sweetcake.ingredients << 'sugar').to eq(['sugar'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      a = ['ing1', 'ign2', 'ing3', 'ing5', 'ing11', 'ing30']
      a.each {|ing| sweetcake.ingredients << ing}
      ing = sweetcake.ingredients.dup
      sweetcake.mix!
      expect(sweetcake.ingredients).not_to eq(ing)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      sweetcake.eat(20)
      expect(sweetcake.quantity).to eq(280)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {sweetcake.eat(500)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jeff the Great Baker")

      expect(sweetcake.serve).to eq("Chef Jeff the Great Baker has made 300 sweetcakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(sweetcake)
      sweetcake.make_more
    end
  end
end
