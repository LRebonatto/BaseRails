class Image < ActiveRecord::Base
  belongs_to :produto

  has_attached_file :image, :styles => { :thumb => "215x140#", :medium => "x500>" },
                                          :convert_options => {
                                            :thumb => "-quality 85",
                                            :medium => "-quality 85",
                                          }

  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg',
                                                              'image/png',
                                                              'image/jpg',
                                                              'image/gif']

  before_create :randomize_file_name

  private

  def randomize_file_name
    extension = File.extname(image_file_name).downcase
    self.image.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
  end
end