class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :observation
      t.string :feeling
      t.string :need
      t.string :request

      t.timestamps
    end
  end
end
