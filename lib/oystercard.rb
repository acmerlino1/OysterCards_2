class Oystercard
  MAXIMUN = 90
  ERROR = {
    max: 'Maximun allowance reached'.freeze,

   }
  attr_reader :balance

    def initialize
      @balance = 0
    end

    def top_up(amount)
        fail ERROR[:max] if @balance >= MAXIMUN

      @balance += amount
    end

    def reduce(amount)
      @balance -= amount

    end
end
