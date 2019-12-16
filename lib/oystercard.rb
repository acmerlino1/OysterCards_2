class Oystercard
  MAXIMUN = 90
  MINIMUM = 1
  MIN_CHARGE = 1
  ERROR = {
    max: 'Maximun allowance reached'.freeze,
    min: 'raise_error if below min amount'
   }
  attr_reader :balance
  attr_accessor :in_journey

    def initialize
      @balance = 0
    end

    def top_up(amount)
      fail ERROR[:max] if @balance >= MAXIMUN

      @balance += amount
    end

    def touch_in
      fail ERROR[:min] if @balance < MINIMUM
      reduce(MIN_CHARGE)
      
      @in_journey = true
   
    end

    def touch_out
      reduce(MIN_CHARGE)
      @in_journey = false
  
    end
private 
    def reduce(amount)
      @balance -= amount
    end
  
end
