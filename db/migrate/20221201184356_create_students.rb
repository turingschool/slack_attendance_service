class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :slack_user_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
