class FixBriansTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :chirps, :authr_id, :author_id
  end
end
