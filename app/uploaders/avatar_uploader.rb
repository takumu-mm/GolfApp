class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # 画像をPNGに変換
  process convert: 'png'

  # 画像リサイズの設定
  version :thumb do
    process resize_to_fit: [100, 100]
  end

  # デフォルト画像を設定
  def default_url
    'Golf_sample_2.jpg'
  end

  # アップロード可能な拡張子のリスト
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Cloudinaryの公開IDを設定（ユニークな識別子）
  def public_id
    return model.id
  end
end