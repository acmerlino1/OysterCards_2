require 'oystercard'

describe Oystercard do
  
  let(:station){ double :station }
    
    # it 'stores the entry station' do
    #   subject.top_up(1)
    #   subject.touch_in(station)
    #   expect(subject.entry_station).to eq station
    # end

    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end

  describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'can top up the balance' do
        expect{ subject.top_up 1}.to change{ subject.balance }.by 1
      end

      it 'Maximum allowance reached'do
      Oystercard::MAXIMUM.times {subject.top_up(1)}
      expect {subject.top_up(1)}.to raise_error(Oystercard::ERROR[:max])
    end
  end


  # describe '#reduce' do
  #   it {is_expected.to respond_to(:reduce).with(1).argument}
  # end
# it 'deducts an amount' do
# subject.top_up(20)
# expect{ subject.reduce(3)}.to change{ subject.balance }.by -3
# end

  describe '#touch_in' do

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it 'can touch in' do
      subject.top_up(Oystercard::MIN_CHARGE)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'raise_error if below min amount' do
      expect {subject.touch_in}.to raise_error(Oystercard::ERROR[:min])
    end

    it 'reduce card amount by min_charge' do
      subject.top_up(5)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MIN_CHARGE)
    end
  end

  # describe '#in_journey' do
  #   it 'returns true if in journey' do
  #     allow(subject).to receive(:entry_station).and_return(true)
  #     expect(subject.in_journey?).to eq(true)
  #   end

  #   it 'returns false if not in journey' do
  #     allow(subject).to receive(:entry_station).and_return(false)
  #     expect(subject.in_journey?).to eq(false)
  #   end
  # end

  describe '#touch_out' do
    it 'reduces by minimum amount' do
      expect {subject.touch_out}.to change { subject.balance }.by -1
    end
  end
end
