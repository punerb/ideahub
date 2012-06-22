FeatherCms::Config.init do |c|
  c.template_store_path = '/tmp/templates'
  c.template_store_type = :db 

  #Note: For basic authentication
  #c.authentication = {name: 'feather', password: 'password'}
  #Note: For before filter
  c.authentication = :authenticate_user!
  
  #c.template_extenstion = 'html'   #default : html
end
