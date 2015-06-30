home_dir = Dir.home
chef_dir = File.join(home_dir, '.chef')
username = ( ENV['USER'] || ENV['USERNAME'] ).downcase

client_key    File.join(chef_dir, "#{username}.pem")
cookbook_path File.join(home_dir, 'build', 'cookbooks')
