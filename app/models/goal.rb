# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  private     :boolean          default(FALSE), not null
#  completed   :boolean          default(FALSE), not null
#  description :string
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ActiveRecord::Base
  after_initialize :set_defaults

  belongs_to :user

  validates :title, :user_id, presence: true
  validates :private, :completed, inclusion: [true, false]

  def set_defaults
    self.private ||= false
    self.completed ||= false
  end
end
