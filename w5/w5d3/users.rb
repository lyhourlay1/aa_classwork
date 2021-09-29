require_relative 'questions_db'

class Users
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM users WHERE id= #{id}")
        Users.new(records.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end