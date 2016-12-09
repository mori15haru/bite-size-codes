# Find the majority element given an array of n elements
#
# majority element := the element that appears more
# than n/2 times
#
# Time O(n),Space O(1)

def majority(list)
  head, *tail = list

  flags = {
    candidate: head,
    count: 1
  }

  tail.each do |e|
    if flags[:candidate] == e
      flags[:count] += 1
    else
      if flags[:count] == 1
        flags[:candidate] = e
      else
        flags[:count] -= 1
      end
    end
  end

  if list.count(flags[:candidate]) > list.length/2
    flags[:candidate]
  else
    nil
  end
end

RSpec.describe '#majority' do
  context 'there is a majority element' do
    let(:list1) { [1,3,4,5,4,4,2,4,4,1,4] }
    let(:list2) { [4,4,4,5,5,5,5] }
    let(:list3) { [3,1,3,1,3,1,3,1,3] }

    it 'returns the majority element' do
      expect(majority(list1)).to eq(4)
      expect(majority(list2)).to eq(5)
      expect(majority(list3)).to eq(3)
    end
  end

  context 'there is no majority element' do
    let(:list) { [1,2,3,4,4,4] }

    it 'returns nil' do
      expect(majority(list)).to be_nil
    end
  end
end
