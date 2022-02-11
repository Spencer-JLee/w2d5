require_relative "item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(str)
        @label = str
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        item = Item.new(title, deadline, description)
        @items.push(item)
        true
    end

    def size
        @items.size
    end

    def valid_index?(num)
        num >= 0 && num < self.size
    end

    def swap(num1, num2)
        return false if !valid_index?(num1) || !valid_index?(num2)
        @items[num1], @items[num2] = @items[num2], @items[num1]
    end

    def [](num)
        return nil if !valid_index?(num)
        @items[num]
    end

    def priority
        @items[0]
    end

    def print
        p self.label
        @items.each_with_index do |n, i|
            p i.to_s + " " + n.title + " " + n.deadline + " " + n.done?.to_s
        end
    end

    def print_full_item(num)
        return nil if !valid_index?(num)
        n = @items[num]
        p n.title + " " + n.deadline + " " + n.description + " " + n.done?.to_s
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !valid_index?(index)
        amount.times do
            if index != 0
                swap(index, index - 1) 
                index -= 1
            else
                break
            end
        end
        true
    end

    def down(index, amount=1)
        return false if !valid_index?(index)
        amount.times do 
            if index != self.size
                swap(index, index + 1)
                index  += 1
            else
                break
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        removed = false

        while !removed
            removed = true
            @items.each_with_index do |n, i|
                if n.done?
                    remove_item(i)
                    removed = false
                    break
                end
            end
        end
    end
                

end