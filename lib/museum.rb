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
end