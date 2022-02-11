class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    # def name=

    # end

    # def flight_numbers

    # end

    # def flight_numbers=

    # end

    def has_flight?(str)
        @flight_numbers.include?(str.upcase)
    end

    def add_flight(str)
        if !has_flight?(str)
            @flight_numbers.push(str.upcase)
        end
    end
end