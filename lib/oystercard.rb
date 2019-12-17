class Oystercard
  MAXIMUM = 90
  MINIMUM = 1
  MIN_CHARGE = 1
  
  ERROR = {
    max: 'Maximum allowance reached'.freeze,
    min: 'raise_error if below min amount'
   }
  attr_reader :balance, :entry_station, :in_journey

    def initialize
      @balance = 0
    end

    def top_up(amount)
      fail ERROR[:max] if @balance == MAXIMUM

      @balance += amount
    end

    def touch_in
      fail ERROR[:min] if @balance < MINIMUM
      @in_journey = true

      # @entry_station = station
#this was failing due to not having a amount
#to succcssfully test top_up(1)

    end

    def touch_out
      reduce(MIN_CHARGE)
      @entry_station = nil
    end

    def in_journey?
      false # !!entry_station
    end

    # private
    
    def reduce(amount)
      @balance -= amount
    end

end
