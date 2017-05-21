Dir.glob('./{config,controllers,forms,lib,views}/init.rb').each do |file|
  require file
end
run FoodyCallApp
