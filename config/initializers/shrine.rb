if Rails.env.development?
 require 'shrine/storage/file_system'
 Shrine.storages = {
   cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
   store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
 }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
 require 'shrine/storage/s3'
 s3_options = {
   access_key_id:  Rails.application.credentials.aws[:access_key_id],
   secret_access_key: Rails.application.credentials.aws[:secret_access_key],
   region: 'ap-northeast-1',
   bucket: ENV['S3_BUCKET_NAME']
 }
 Shrine.storages = {
   cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
   store: Shrine::Storage::S3.new(prefix: 'store', **s3_options),
 }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :data_uri
Shrine.plugin :default_url
Shrine.plugin :determine_mime_type
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :pretty_location
Shrine.plugin :processing
Shrine.plugin :remove_attachment
Shrine.plugin :restore_cached_data
Shrine.plugin :validation_helpers
