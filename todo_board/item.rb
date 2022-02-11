class Item
    def self.valid_date?(str)
        date = str.split("-")
        date[1].to_i > 0 && date[1].to_i < 13 && date[2].to_i > 0 && date[2].to_i < 32
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise
        end
        @description = description
        @done = false
    end

    def done?
        @done
    end

    def toggle
        @done = !@done 
    end

    def title
        @title
    end

    def title=(str)
        @title = str
    end

    def deadline
        @deadline
    end

    def deadline=(str)
        if Item.valid_date?(str)
            @deadline = str
        else
            raise
        end
    end

    def description
        @description
    end

    def description=(str)
        @description
    end
end