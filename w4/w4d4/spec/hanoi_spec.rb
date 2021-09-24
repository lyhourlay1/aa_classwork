require "hanoi"

describe "Hanoi" do
  subject(:h){Hanoi.new([1,2,3,4,5,6])}

  describe "#intialize" do
    it "raise error if no argument is passed" do
      expect(Hanoi.new).to raise_error(ArgumentError)
    end

    it "create array1 with passed in argument" do
      expect(h.array1).to eq([1,2,3,4,5,6])
    end

    it "create two empty arrays" do
      expect(h.array2).to be_empty
      expect(h.array3).to be_empty
    end
  end
  describe "#won?" do 
    it "move all elements to array3" do
      expect(h.array3).to eq([1,2,3,4,5,6])
      expect(h.array2).to be_empty
      expect(h.array1).to be_empty
    end
  end

  describe "#move" do
    before(:each){h.move(1, 3)}
    it "remove the top element out of the specified array" do
      expect(h.array1).to eq([1, 2, 3, 4, 5])
    end
    it "add element to top of specified array" do
      expect(h.array3).to eq([6])
    end
  end

end