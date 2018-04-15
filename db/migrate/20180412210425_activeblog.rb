class Activeblog < ActiveRecord::Migration[5.2]
  def change

    create_table :posts do |t|
        t.text :post_title
        t.text :post_body

  end
end
end