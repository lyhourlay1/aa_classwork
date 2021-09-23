require "hanoi"

describe "Hanoi" do
  subject(:h){Hanoi.new([4, 5, 1, 6, 3, 2])}

  describe "#intialize" do
    it "raise error if no argument is passed" do
      expect(Hanoi.new).to raise_error(ArgumentError)
    end

    it "create array1 with passed in argument" do
      expect(h.array1).to eq([4, 5, 1, 6, 3, 2])
    end

    it "create two empty arrays" do
      expect(h.array2).to be_empty
      expect(h.array3).to be_empty
    end



    # it "creates three arrays to store values" do
    #   expect(h.arrays.length).to eq(3)
    # end

    # it "creates three empty arrays" do
    #   expect(h.arrays.all?{|el| el.empty?}).to be_truthy
    # end

    # it "creates unique arrays" do

    # end



  end

end