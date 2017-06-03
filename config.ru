Dir.glob('./{config,controllers,forms,lib,views,models}/init.rb').each do |file|
  require file
end
run FoodyCallApp
