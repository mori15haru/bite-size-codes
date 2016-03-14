# Find duplicates given an array of n elements
# which contains elements from 0 to n-1
#
# Time O(n),Space O(1)

def duplicates(array)
  dups = []
 
  array.clone.each do |e|
    if array[e] < 0
      dups << e 
    else
      array[e] = -array[e] 
    end 
  end

  return dups
end

RSpec.describe '#duplicates' do
  context 'two pairs' do
    let(:array) { [3,4,5,1,4,5] }

    it 'returns those two elements' do
      expect(duplicates(array)).to eq([4,5]) 
    end
  end

  context 'one pair' do
    let(:array) { [1,2,3,4,1] }
    
    it 'returns the element' do
      expect(duplicates(array)).to eq([1])
    end
  end

  context 'none' do
    let(:array) { [0,1,2,3] }
    
    it 'returns empty array' do
      expect(duplicates(array)).to eq([])
    end
  end
end
