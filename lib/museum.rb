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

    
    def recommend_exhibits(patron)
        exhibits = []
        @exhibits.each do |exhibit|
            patron.interests.each do |interest|
               if exhibit.name == interest
               exhibits << exhibit
               end
            end
        end
        exhibits
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