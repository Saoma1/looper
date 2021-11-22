class CreateMovieTorrents < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_torrents do |t|
      t.string :title
      t.string :url
      t.string :genre
      t.datetime :release_date
      t.string :poster_url
      t.boolean :clicked, default: false

      t.timestamps
    end

    add_reference :movie_torrents, :movie, null: false, foreign_key: true
  end
end
