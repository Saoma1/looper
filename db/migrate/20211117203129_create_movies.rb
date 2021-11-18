class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.datetime :release_date
      t.string :poster_url
      t.boolean :found, default: false

      t.timestamps
    end

    add_reference :movies, :user, null: false, foreign_key: true
  end
end
