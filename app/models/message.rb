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

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  has_many :recipients

  scope :drafts, -> { where(draft: true) }
end