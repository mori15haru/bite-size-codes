# Find duplicates given an array of n elements
# in the range from 0 to n-1
#
# Time O(n), Extra space O(1)

def duplicates(dups, this_array, array)
  head, *tail = this_array

  if head.nil?
    return dups
  end

  index = head.abs

  if array[index] < 0
    dups << index
  else
    array[index] *= -1
  end

  duplicates(dups, tail, array)
end

RSpec.describe '#duplicates' do
  context 'two pairs' do
    # arrays modified after testing
    let(:array) { [3,4,5,1,4,5] }

    it 'returns those two elements' do
      expect(duplicates([], array, array)).to eq([4,5])
    end
  end

  context 'one pair' do
    let(:array) { [1,2,3,4,1] }

    it 'returns the element' do
      expect(duplicates([], array, array)).to eq([1])
    end
  end

  context 'none' do
    let(:array) { [0,1,2,3] }

    it 'returns empty array' do
      expect(duplicates([], array, array)).to eq([])
    end
  end
end
