json.extract! user, :id, :name, :location_id, :birth_year

json.chirp_ids user.chirps.pluck(:id)