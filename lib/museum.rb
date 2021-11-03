class Museum 
    attr_reader :name,
                :exhibits,
                :patrons

    def initialize(name)
        @name     = name 
        @exhibits = []
        @patrons  = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def interests_list(patron)
        patron.interests.map do |interest|
            interest
        end
    end

    def recommend_exhibits(patron)
        @exhibits.map do |exhibit|
            if interests_list(patron).include?(exhibit.name)
               exhibit
            end 
        end.compact
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
        @exhibits.reduce({}) do |hash, exhibit|
            hash[exhibit] = @patrons.find_all do |patron|
                patron.interests.include?(exhibit.name)
            end
            hash
        end
    end

    def ticket_lottery_contestants(exhibit)
        @patrons.find_all { |patron| patron.spending_money < exhibit.cost}
    end

    def draw_lottery_winner(exhibit)
        ticket_lottery_contestants(exhibit).sample
    end
end