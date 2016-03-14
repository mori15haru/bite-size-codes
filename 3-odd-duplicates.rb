# Find the element that appears odd number of times
# given an array of positive numbers
#
# There exists only one such element
#
# Time O(n)

def odd_duplicates(array)
  xor = array.reduce(0, :^)
end

RSpec.describe '#odd_duplicates' do
  let(:array) { [4,1,4,3,2,4,3,1,2] }

  context 'no such element' do
    let(:array) { [1,2,1,2,1,2,1,2] }

    it 'returns 0' do
      expect(odd_duplicates(array)).to eq(0)
    end
  end

  it 'returns such element' do
    expect(odd_duplicates(array)).to eq(4)
  end
end
