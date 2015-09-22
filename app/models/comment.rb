# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string
#  commenter_id     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, :commenter_id, :commentable_id, :commentable_type, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User'
end
