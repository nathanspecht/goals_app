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

FactoryGirl.define do
  factory :goal do
    title { Faker::Book.title }
    description { Faker::Hacker.say_something_smart }
    association :user
  end

end
