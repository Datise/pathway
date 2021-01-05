class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :logins
      t.integer :referer_id
      t.string :referral_url

      t.timestamps
    end
  end
end
