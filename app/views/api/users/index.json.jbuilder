# json.array! @users, :id, :name, :location_id

#json.users do 
#  @users.each do |user|
#    json.set! user.id do
#      json.partial! "api/users/user", user: user
     # json.authored_chirps do
     #   user.chirps.each do |chirp|
     #     json.set! chirp.id do
     #       json.extract! chirp, :id, :body
     #     end
     #   end
     # end
#    end
#  end
#end

@users.each do |user|
  json.set! user.id do
    json.partial! "api/users/user", user: user
  end
end