require_relative 'questions_db'

class Reply
    attr_accessor :id, :user_id, :body, :question_id, :parent_id

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM replies WHERE id= #{id}")
        Reply.new(records.first)
    end

    def self.find_by_user_id(user_id)
        records = QuestionsDB.instance.execute(<<-SQL, user_id) 
          SELECT 
            * 
          FROM 
            replies
          WHERE 
            user_id = ? 
        SQL
        records.map {|record| Reply.new(record)}
    end
    
    def self.find_by_question_id(question_id)
        records = QuestionsDB.instance.execute(<<-SQL, question_id) 
          SELECT 
            * 
          FROM 
            replies
          WHERE 
            question_id = ? 
        SQL
        records.map {|record| Reply.new(record)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @body = options['body']
    end
end