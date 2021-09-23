require "random"

describe Array do
  subject(:arr) {Array.new([1, 2, 2, 3, 3])}
  
  describe "my_uniq" do
    it "return array from original array" do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end

    it "does not modify original" do
      expect(arr.my_uniq).to_not be(arr)
    end

  end
end