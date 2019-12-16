require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'can top up the balance' do
        expect{ subject.top_up 1}.to change{ subject.balance }.by 1
      end

      it 'Maximun allowance reached'do
      Oystercard::MAXIMUN.times {subject.top_up(1)}
      expect {subject.top_up(@balance)}.to raise_error(Oystercard::ERROR[:max])
    end


  describe '#reduce' do
    it {is_expected.to respond_to(:reduce).with(1).argument}
  end
it 'deducts an amount' do
subject.top_up(20)
expect{ subject.reduce 3}.to change{ subject.balance }.by -3
end

  describe '#touch_in' do
    it 'raise_error if below min amount' do
      expect {subject.touch_in(@balance)}.to raise_error(Oystercard::ERROR[:min])
    end
  describe '#in_journey' do
  it 'returns true if in journey' do
    allow(subject).to receive(:in_journey).and_return(true)
    expect(subject.in_journey).to eq(true)
  end

  it 'returns false if not in journey' do
    allow(subject).to receive(:in_journey).and_return(false)
    expect(subject.in_journey).to eq(false)
  end
end
end
end
end
