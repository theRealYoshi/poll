class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.timestamps
    end
    add_index(:users, :user_name, {unique: true})

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.text :question_text, null: false
      t.integer :poll_id
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.integer :question_id
      t.text :answer_text, null: false
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :respondent_id
      t.timestamps
    end
  end
end
