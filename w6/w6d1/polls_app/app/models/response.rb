# == Schema Information
#
# Table name: responses
#
#  id                :bigint           not null, primary key
#  answer            :string           not null
#  answer_choices_id :integer          not null
#  user_id           :integer          not null
#
class Response < ApplicationRecord
    belongs_to :answer_choices,
        primary_key: :id,
        foreign_key: :answer_choices_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end


#unqiness 
#double check on assocaition: no through source
# alwasy add index