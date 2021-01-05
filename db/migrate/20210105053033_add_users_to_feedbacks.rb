class AddUsersToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    change_table(:feedbacks) do |t|
      t.references :from, foreign_key: {to_table: 'users'}
      t.references :to, foreign_key: {to_table: 'users'}
    end
  end
end
