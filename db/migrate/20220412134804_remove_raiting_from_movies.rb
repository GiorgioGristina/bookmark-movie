class RemoveRaitingFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :raiting, :float
  end
end
