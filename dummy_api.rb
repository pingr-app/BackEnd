# pingr.rb
require 'sinatra'
require 'json'
require 'securerandom'
require 'faker'

get '/' do
  status 200
  JSON.pretty_generate({:response => "Welcome to the Pingr API :)!"})
end

get '/users' do
  id = params['id']
  return_message = {}
  return_message[:id] = id 
  return_message[:first_name] = Faker::Name.first_name
  return_message[:last_name] = Faker::Name.last_name
  return_message[:bio] = "A user"
  status 200
  JSON.pretty_generate(return_message)
end

post '/users' do
  request.body.rewind
  data = JSON.parse request.body.read

  return_message = {}
  return_message[:id] = SecureRandom.uuid
  return_message[:first_name] = data['first_name']
  return_message[:last_name] = data['last_name']
  return_message[:bio] = data['bio']
  status 201
  JSON.pretty_generate(return_message)
end

get '/users/friends' do
  id = params['id']
  status = params['friend_status'] # status: confirmed, requested, pending
  map_id = params['map_id'] # map_id: id for the map to filter friends by map (counts as loc=true)
  loc = params['loc']       # loc   : true or false for location info


  friends = []
  
  rand(10).times do
    friends << {} 
  end

  friends.each do |friend|
    friend[:id] = SecureRandom.uuid
    friend[:first_name] = Faker::Name.first_name
    friend[:last_name] = Faker::Name.last_name
    if !friend_status.nil? && friend_status != "pending" && friend_status != "requested"
      if loc == "true"
        friend[:map_id] = rand(25)
        friend[:x_coord] = rand(101)
        friend[:y_coord] = rand(301)
        friend[:time] = Faker::Time.between(DateTime.now - 1, DateTime.now)
      end
      if !map_id.nil?
        friend[:map_id] = map_id
      end
    end
  end
  
  status 200
  JSON.pretty_generate({"id" => id, "friends" => friends})

end

post '/users/friends' do
  # adding a friend
  request.body.rewind
  data = JSON.parse request.body.read
  
  return_message = {}
  return_message[:id] = params["id"]
  return_message[:friend_id] = data["friend_id"]
  return_message[:first_name] = Faker::Name.first_name
  return_message[:last_name] = Faker::Name.last_name
  
  i = rand(3)
  if i == 0
    friend_status = "confirmed"
  elsif i == 1
    friend_status = "pending"
  elsif i == 2
    friend_status = "requested"
  end

  return_message[:friend_status] = friend_status
  status 201

  JSON.pretty_generate(return_message)

end
