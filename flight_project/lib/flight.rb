class Flight
    def initialize(str, num)
        @flight_number = str
        @capacity = num
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        @passengers.push(passenger) if passenger.has_flight?(@flight_number) && !self.full? 
    end

    def list_passengers
        arr = []

        @passengers.each do |n|
            arr.push(n.name)
        end

        arr
    end

    def [](num)
        @passengers[num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end