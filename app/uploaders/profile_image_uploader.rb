class ProfileImageUploader < Shrine
  require 'image_processing/mini_magick'

  MAX_SIZE = 8 * 1024 * 1024 # 8MB

  plugin :remote_url, max_size: MAX_SIZE

  # public/images/fallback/
  Attacher.default_url do
    '/images/fallback/default_profile_image.png'
  end

  Attacher.validate do
    validate_max_size MAX_SIZE, message: '画像のサイズは8MB以内です'
    validate_mime_type_inclusion %w[image/jpeg image/png], message: '拡張子はJPEGかPNGだけ使えます'
  end
end
