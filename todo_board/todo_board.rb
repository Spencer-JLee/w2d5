require_relative 'list.rb'

class TodoBoard
    def initialize()
        @hash = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @hash[*args] = List.new(*args)
        when 'ls'
            @hash.each_key do |key|
                p key
            end
        when 'showall'
            @hash.each_key do |key|
                @hash[key].print
            end
        when 'mktodo'
            @hash[*args[0]].add_item(*args[1..-1])
        when 'up'
            @hash[*args[0]].up(*args[1..-1].map(&:to_i))
        when 'down'
            @hash[*args[0]].down(*args[1..-1].map(&:to_i))
        when 'swap'
            @hash[*args[0]].swap(*args[1..-1].map(&:to_i))
        when 'sort'
            @hash[*args[0]].sort_by_date!
        when 'priority'
            @hash[*args[0]].print_priority
        when 'print'
            if args.length < 2
                @hash[*args[0]].print
            else
                @hash[*args[0]].print_full_item(*args[1..-1].map(&:to_i))
            end
        when 'toggle'
            @hash[*args[0]].toggle_item(*args[1..-1].map(&:to_i))
        when 'rm'
            @hash[*args[0]].remove_item(*args[1..-1].map(&:to_i))
        when 'purge'
            @hash[*args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while self.get_command
            self.get_command
        end
    end
end