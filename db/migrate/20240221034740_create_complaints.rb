class CreateComplaints < ActiveRecord::Migration[7.1]
  def change
    create_table :complaints do |t|
      t.string :subject
      t.text :description
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
