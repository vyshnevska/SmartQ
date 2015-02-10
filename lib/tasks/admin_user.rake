namespace :admin_user do
  desc "Create a admin user"
  task :create => :environment do
    params = {
      email: 'admin@smart.com',
      password: '1q2w3e4r',
      password_confirmation: '1q2w3e4r',
      name: 'Street Smart Admin'
    }

    if User.find_by_email(params[:email])
      puts "Admin is already created!"
      break
    end

    admin = User.new(params)
    if admin.save && admin.admin!
      puts "Welcome Admin!"
    else
      puts "Sorry, can't create admin user"
      puts admin.errors.full_messages.join(',')
    end
  end
end
