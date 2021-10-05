# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :string           not null
#  question_id :integer          not null
#
class AnswerChoice < ApplicationRecord
    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question
    
    has_many :responses,
        primary_key: :id,
        foreign_key: :response_id,
        class_name: :Response
end
