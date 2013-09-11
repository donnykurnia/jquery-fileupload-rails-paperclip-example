class Upload < ActiveRecord::Base
  # paperclip with the upload path default configuration
  has_attached_file :upload,
    :path => ":rails_root/public:url",
    :url  => "/system/:class/:attachment/:id_partition/:style/:filename"

  # associations
  belongs_to :prompt

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "reffid" => read_attribute(:reffid),
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
