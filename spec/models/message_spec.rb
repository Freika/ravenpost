# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  draft      :boolean
#  sender_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_sender_id  (sender_id)
#

describe Message, type: :model do
  it do
    should belong_to(:sender)
      .with_foreign_key(:sender_id)
      .class_name('User')
  end
  it { should have_many(:user_messages).dependent(:destroy) }
end
