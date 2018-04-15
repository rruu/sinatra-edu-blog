class ActiveblogComments < ActiveRecord::Migration[5.2]
  def change

    create_table :comments do |t|
        t.text :comment_author
        t.text :comment_message

  end
end
end