home_dir   = Dir.home
chef_dir   = File.join(home_dir, '.chef')
secret_dir = File.join(chef_dir, 'private')
username   = ( ENV['USER'] || ENV['USERNAME'] ).downcase

node_name     username
client_key    File.join(secret_dir, "#{username}.pem")
cookbook_path File.join(home_dir, 'build', 'cookbooks')
