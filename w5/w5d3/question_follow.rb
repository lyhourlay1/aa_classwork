require_relative 'questions_db'
require_relative 'user'

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        records = QuestionsDB.instance.execute("SELECT * FROM question_follows WHERE id= #{id}")
        QuestionFollow.new(records.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.followers_for_questions_id(question_id)
        records = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
            users.id, fname, lname
            FROM
            users
            JOIN
            question_follows ON users.id = question_follows.user_id
            WHERE question_follows.question_id = ?
        SQL
        records.map {|record| User.new(record)}
    end
end