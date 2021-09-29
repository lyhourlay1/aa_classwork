require 'sqlite3'
require 'singleton'

class QuestionsDB < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true 
    end
end

class Question
    def self.find_by_id(id)
        record = QuestionsDB.instance.execute("SELECT * FROM questions WHERE id= #{id}")
        Question.new(record)
    end
end
