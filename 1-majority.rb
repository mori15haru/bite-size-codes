# Find the majority element given an array of n elements
#
# Majority element := the element that appears more
# than n/2 times
#
# Time O(n), Extra space O(1)

def get_cand(flags, list)
  head, *tail = list

  if head.nil?
    return flags[:candidate]
  end

  if flags[:candidate] == head
    flags[:count] += 1
  else
    if flags[:count] == 1
      flags[:candidate] = head
    else
      flags[:count] -= 1
    end
  end

  get_cand(flags, tail)
end

def majority(list)
  cand = get_cand(
    {
      candidate: list.first,
      count: 1
    },
    list
  )

  list.count(cand) > list.length/2 && cand
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

    it 'returns false' do
      expect(majority(list)).to be false
    end
  end
end
