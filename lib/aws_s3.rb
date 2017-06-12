require 'sinatra'
require "base64"
require 'aws-sdk'


#
# def save_image
#     bucket = AWS::S3::Bucket.find(ENV['AWS_BUCKET'])
#     file = params['myfile'][:tempfile]
#     AWS::S3::S3Object.store(file, open(file), bucket)
#     puts AWS::S3::Bucket.objects('mybucket').size
# end

class AWS
  # AWS::S3::Base.establish_connection!(
  #     :access_key_id => ENV['AWS_KEY'],
  #     :secret_access_key => ENV['AWS_SECRET']
  # )
  Aws.config.update({
  region: 'us-east-1'
})
  def self.save_image(data:,fileType:)
    # s3 = AWS::S3.new(:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET'])
    s3 =  Aws::S3::Resource.new
    bucket = s3.bucket(ENV['AWS_BUCKET'])
    data = Base64.decode64(data)
    type = "image/#{fileType.downcase}"
    extension = fileType.downcase
    name = ENV['AWS_PATH']+('a'..'z').to_a.shuffle[0..7].join + ".#{extension}"
    obj = bucket.put_object(key:name,body:data,acl:"public-read")
    url = obj.public_url().to_s
    url
  end
end
