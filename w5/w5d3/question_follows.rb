require_relative 'questions_db'

class QuestionFollows
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM question_follows WHERE id= #{id}")
        QuestionFollows.new(records.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end