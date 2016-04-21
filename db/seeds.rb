# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear the database
Category.delete_all
Comment.delete_all
Event.delete_all
Group.delete_all
Message.delete_all
Neighborhood.delete_all
Post.delete_all
Request.delete_all
User.delete_all

# Create Admin
User.new(name: 'Admin', username: 'admin', password: 'admin123', user_type: 'admin', email: 'admin@email.com').save!

# Create ordindary users
jake = User.new(name: 'Jake from Statefarm', username: 'jake1234', password: 'jake1234', user_type: 'user', email: 'jake@statefarm.com')
jake.save!

jill = User.new(name: 'Jill', username: 'jill1234', password: 'jill1234', user_type: 'user', email: 'jill@example.com')
jill.save!

joe = User.new(name: 'Joe', username: 'joebob123', password: 'joebob123', user_type: 'user', email: 'joe@bob.com', phone_number: '111-222-3333', description: 'I\'m just a cool guy')
joe.save!

# Create a Newser
miller = User.new(name: 'Miller Realty', username: 'millerman', password: 'millerman', user_type: 'newser', email: 'miller@yahoo.com', phone_number: '445-555-1432', description: 'I wonder what rainbows taste like')
miller.save!

matt = User.new(name: 'Sports Warehouse', username: 'matt1234', password: 'matt1234', user_type: 'newser', email: 'matt@sportsequipment.com')
matt.save!

place = Neighborhood.new(name: 'Placeton Place', location: '123 Fake Street', threshold: 100, description: 'It\'s a place for places to be')
place.users << jake
place.users << matt
place.users << jill
place.leads << jill
place.save!

parent_place = Neighborhood.new(name: 'Parents Palace', location: '42 Wallaby Way, Sydney', threshold: 600, description: 'This is a big place for big things')
parent_place.users << jake
parent_place.users << matt
parent_place.users << miller
parent_place.leads << jake
parent_place.children << place
place.save!

fun = Category.new(name: 'Fun', description: 'Enjoyable things')
parent_place.categories << fun
fun.save!

misc = Category.new(name: 'Miscellaneous', description: 'Default Category')
place.categories << misc
misc.save!

sales = Category.new(name: 'Sales', description: 'For selling things')
place.categories << sales
sales.save!

jakepost = Post.new(title: 'Buy Insurance', body: 'hey you guys should check out this great discount I found', score: 4)
place.posts << jakepost
jake.posts << jakepost
jakepost.category = sales
jakepost.save!

millerpost = Post.new(title: 'Hello World', body: 'I wonder if you guys can read this in your own neighborhood', score: 6)
parent_place.posts << millerpost
miller.posts << millerpost
millerpost.category = fun
millerpost.save!

mattpost = Post.new(title: 'Health Survey', body: 'Hey could you guys please take a look at the survey that\'s been going around? It would help bunches', score: 6)
place.posts << mattpost
matt.posts << mattpost
mattpost.category = misc
mattpost.save!


millercomment = Comment.new(comment: 'I believe even the comments should show up too', score: 3)
miller.comments << millercomment
millerpost.comments << millercomment
millercomment.save!

jillcomment = Comment.new(comment: 'sure thing', score: 2)
jill.comments << jillcomment
mattpost.comments << jillcomment
jillcomment.save!

jakecomment = Comment.new(comment: 'I\'ll try to get to that sometime', score: 1)
jake.comments << jakecomment
mattpost.comments << jakecomment
jakecomment.save!

jakeevent = Event.new(name: 'Party', location: 'at my house', status: 'accepted', start_time: Time.now, description: 'Bring your own beer but I\'m buying food so you will be fed. Feel free to bring snacks though.')
jake.events << jakeevent
place.events << jakeevent
jakeevent.save!

mattevent = Event.new(name: 'Blow-out Sales', location: '234 Place street', status: 'pending', start_time: Time.now, description: 'I\'ll be selling lots of new sports equipment. Come on by')
matt.events << mattevent
place.events << mattevent
mattevent.save!

millerevent = Event.new(name: 'Open House (Literally)', location: 'Fake Street', status: 'accepted', start_time: Time.now, description: 'Interested in buying a new home? Many beautiful homes on Fake Street will be open for viewing on this day! Refreshments willl be served as well.')
miller.events << millerevent
parent_place.events << millerevent
millerevent.save!

mattrequest = Request.new(request_type: 'event')
matt.requests << mattrequest
place.requests << mattrequest
mattrequest.event = mattevent
mattrequest.save!

joerequest = Request.new(request_type: 'join')
joe.requests << joerequest
place.requests << joerequest
joerequest.save!

# Event.create(:name => "seed data", :description => "Come out!", :start_time => Time.now, :location => "vsu")
