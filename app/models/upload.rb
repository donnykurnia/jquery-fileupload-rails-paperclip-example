class Upload < ActiveRecord::Base
  # paperclip with the upload path default configuration
  # has_attached_file :upload,
  #   :path => ":rails_root/public:url",
  #   :url  => "/system/:class/:attachment/:id_partition/:style/:filename"

  mount_uploader :upload, UploadFileUploader, :mount_on => :upload_file_name

  # associations
  belongs_to :prompt

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload),
      "size" => upload.size,
      "url" => upload.url,
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
