# require 'sinatra'
# require 'aws/s3'
#
# AWS::S3::Base.establish_connection!(
#     :access_key_id => ENV['AWS_KEY'],
#     :secret_access_key => ENV['AWS_SECRET']
# )
#
# get '/upload' do
#     print 'Ez van a bucketekben:'
#     print AWS::S3::Service.buckets
#     erb :upload
# end
#
# # Handle POST-request (Receive and save the uploaded file)
# post '/upload' do
#     bucket = AWS::S3::Bucket.find(ENV['AWS_BUCKET'])
#     file = params['myfile'][:tempfile]
#     AWS::S3::S3Object.store(file, open(file), bucket)
#     puts AWS::S3::Bucket.objects('mybucket').size
# end
