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
  end
  end
