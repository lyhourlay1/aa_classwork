require_relative 'questions_db'

class Replies
    attr_accessor :id, :user_id, :body, :question_id, :parent_id

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM replies WHERE id= #{id}")
        Replies.new(records.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @body = options['body']
    end
end