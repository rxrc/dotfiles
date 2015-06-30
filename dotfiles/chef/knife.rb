home_dir = Dir.home
chef_dir = File.join(home_dir, '.chef')
username = ( ENV['USER'] || ENV['USERNAME'] ).downcase

node_name     username
client_key    File.join(chef_dir, "#{username}.pem")
cookbook_path File.join(home_dir, 'build', 'cookbooks')
