# Find the majority element given an array of n elements
#
# majority element := the element that appears more
# than n/2 times
#
# Time O(n),Space O(1)

def majority(list)
  flags = {
    element: 0,
    count: 0
  }

  list.each do |e|
    if flags[:element] == e
      flags[:count] += 1
    else
      if flags[:count] == 0
        flags[:element] = e
      end
    end
  end

  if list.count(flags[:element]) > list.length/2
    flags[:element]
  else
    nil
  end
end

RSpec.describe'#majority' do
  context 'there is a majority element' do
    let(:list) { [1,3,4,5,4,4,2,4,4,1,4] }
    
    it 'returns the majority element' do
      expect(majority(list)).to eq(4)
    end
  end

  context 'there is no majority element' do
    let(:list) { [1,2,3,4,4,4] }
    
    it 'returns nil' do
      expect(majority(list)).to be_nil
    end
  end
end
