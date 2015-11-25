# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
