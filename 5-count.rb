# Given an unsorted array of n intergers
# in the range from 1 to n, count the frequencies.
#
# Time O(n), Extra space O(1)

def count(array)
  jump = array.count + 1
  array.each do |element|
    array[element%jump-1] += jump
  end

  array.map { |element| element/jump }
end

RSpec.describe '#count' do
  context 'two pairs' do
    let(:array) { [3,4,5,1,4,5] }

    it 'returns the array of counts' do
      expect(count(array)).to eq([1,0,1,2,2,0])
    end
  end
end
