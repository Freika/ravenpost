module MessagesHelper
  def receivers_for_select
    options_from_collection_for_select(User.all, :id, :first_name)
  end
end
