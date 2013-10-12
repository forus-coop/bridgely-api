# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# NOTE THESE ARE FOR TESTING AND NEED TO BE UPDATED BEFORE GOING TO PRODUCTION

user1 = V1::Admin::User.new( {name: 'Sergey Zelvenskiy', email: 'sergey@forusall.com', password: 'test_password' } )
user1.update_attribute( :admin, true )

user2 = V1::Admin::User.new( {name: 'David Ramirez', email: 'david@forusall.com', password: 'test_password' } )
user2.update_attribute( :admin, true )

user2.create_company({
  name: 'ForUs',
  short_name: 'forus',
  account_sid: TWILIO_SID,
  sub_auth_token: TWILIO_AUTH_TOKEN,
  settings:{
    autoresponder: 'Thanks for joining the [company] mobile directory, [name]! Visit [link] to get started',
    responder_link_root: 'www.forusall.com',
    account_phone_number: '+15106069589'
  }
})
user2.save
