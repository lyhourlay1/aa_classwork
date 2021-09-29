require_relative 'questions_db'

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM questions WHERE id= #{id}")
        Question.new(records.first)
    end

    def self.find_by_author_id(author_id)
        records = QuestionsDB.instance.execute(<<-SQL, author_id) 
          SELECT 
            * 
          FROM 
            questions 
          WHERE 
            author_id = ? 
        SQL
        Question.new(records.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end


