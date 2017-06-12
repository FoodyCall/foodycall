# Copy this file to [app]/config/config_env.rb

config_env :development, :test do
  set 'MSG_KEY','9y9e8M/mspL0WTq0ADGvOz0rTrjO+QuIQI/XZOCLDbU='
  set 'AWS_ACCESS_KEY_ID','AKIAJJQ2CLRPK6M2EN3A'
  set 'AWS_SECRET_ACCESS_KEY','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'
  set 'AWS_REGION', 'us-east-1'
  set 'AWS_BUCKET', 'foodycall'
  set 'AWS_PATH', "#{ENV['RACK_ENV']}/"
end

config_env :test do
end

config_env :production do
  set 'MSG_KEY',''
end
