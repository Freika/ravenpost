# == Schema Information
#
# Table name: recipients
#
#  id         :integer          not null, primary key
#  message_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_recipients_on_message_id  (message_id)
#  index_recipients_on_user_id     (user_id)
#

class Recipient < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
