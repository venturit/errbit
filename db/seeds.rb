puts "Seeding database"
puts "-------------------------------"

# Create an initial Admin User
admin_username = "prabode"
admin_email = "prabode@gmail.com"
admin_pass  = 'm1l3n@2009'

puts "Creating an initial admin user:"
puts "-- username: #{admin_username}" if Errbit::Config.user_has_username
puts "-- email:    #{admin_email}"
puts "-- password: #{admin_pass}"
puts ""
puts "Be sure to change these credentials ASAP!"
user = User.where(:email => admin_email).first || User.new({
  :name                   => 'Prabode Weebadde',
  :email                  => admin_email,
  :password               => admin_pass,
  :password_confirmation  => admin_pass
})
user.username = admin_username if Errbit::Config.user_has_username

user.admin = true
user.save!

