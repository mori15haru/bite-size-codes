# Given a sorted array and a number k,
# find a pair whose sum is k
#
# Time O(n)

def find_pair(pair, array, k)
  left, right = pair

  if left >= right
    return nil
  end

  small = array[left]
  big   = array[right]
  sum   = small + big

  if sum == k
    return [small, big]
  elsif sum > k
    right -= 1
  else
    left += 1
  end

  find_pair([left, right], array, k)
end

RSpec.describe do
  let(:array) { [2,4,5,6,8,10,11,20] }
  let(:sum) { 16 }

  context 'no such a pair' do
    let(:array) { [3,4,9,100] }

    it 'returns nil' do
      expect(find_pair([0, array.length-1], array, sum)).to be_nil
    end
  end

  it 'returns the pair' do
    expect(find_pair([0, array.length-1], array, sum)).to eq([5,11])
  end
end
