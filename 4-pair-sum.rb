# Given a sorted array and a number k,
# find a pair whose sum is k
#
# Time O(n)

def find_pair(array, k)
  flags = {
    left: 0,
    right: array.length-1
  }

  while(flags[:left] < flags[:right]) do
    small = array[flags[:left]]
    big   = array[flags[:right]]
    sum   = small + big
    if sum == k
      return [small, big]
    elsif sum > k
      flags[:right] -= 1
    else
      flags[:left] += 1
    end
  end
end

RSpec.describe do
  let(:array) { [2,4,5,6,8,10,11,20] }
  let(:sum) { 16 }

  context 'no such a pair' do
    let(:array) { [3,4,9,100] }

    it 'returns nil' do
      expect(find_pair(array, sum)).to be_nil
    end
  end

  it 'returns the pair' do
    expect(find_pair(array, sum)).to eq([5,11])
  end
end
