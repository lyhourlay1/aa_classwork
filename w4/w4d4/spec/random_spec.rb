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
    #does not take arguments
  end

  describe "two_sum" do
    let(:array) {[0,1,-1,2,-2,7,8,9,-7]}
    let(:array1) {[-7,9,8,-2,7,2,-1,1,0]}
    it "find pairs of position that sum to 0" do
      expect(array.two_sum).to eq([[1,2],[3,4],[5,8]])
    end
  end

  describe "my_transpose" do
    let(:arr2d) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}
    let(:unevenArray) {[
      [0, 1, 2],
      [3, 4],
      [6, 7, 8]
    ]}

    it "array dimension is the same" do
      expect(arr2d.length).to eq(arr2d.my_transpose.length)
      expect(arr2d[0].length).to eq(arr2d.my_transpose[0].length)
    end

    # it "raise error if array is not symmetrical" do
    #   expect{unevenArray.my_transpose}.to raise_error "Uneven Array"
    # end

    it "transposes array correctly" do
      expect(arr2d.my_transpose).to eq(arr2d.transpose)
    end

    it "does not modify original" do
      expect(arr2d.my_transpose).to_not be(arr2d)
    end
  end

end