Dir.glob('./{config,controllers,forms,lib,views,models,services}/init.rb').each do |file|
  require file
end
run FoodyCallApp
