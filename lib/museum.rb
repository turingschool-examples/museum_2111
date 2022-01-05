class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    by_exhibit_interest = Hash.new(0)
    @exhibits.each do |exhibit|
      by_exhibit_interest[exhibit.name]
    end
    # binding.pry
    by_exhibit_interest
    end

end


def students_by_group
    expected = {}
    @courses.each do |course|
      course.students.each do |student|
        #if key does not exist
        if expected[student.group].nil?
          # create key and give it a starter array
          expected[student.group] = [student]
        #if key exists && student is not in the value array
        elsif !expected[student.group].include?(student)
          #shovel student into existing value array
          expected[student.group] << student
        end
      end
    end
    expected
  end

# patrons_array = @patrons.flat_map do |patron|
#   patron.interests
# end.uniq
# binding.pry
# patrons_array.group_by do |patron|
#   patrons_array.interest
# end

# @patrons.group_by do |patron|
#   patron.interests.uniq
# end
