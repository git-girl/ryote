# frozen_string_literal: true

# These are very close to UI representations of Notes i take
class Note < ApplicationRecord
  has_one_attached :html_file
  has_one :tag
  # TODO: add a tag migration

  def name
    name = created_at.to_s unless title.present?
    name = title
    name = 'The nameless note' unless name.present?
  end

  def file_path
    ActiveStorage::Blob.service.path_for(html_file.key)
  end

  def splattable_path
    FileManager.seperate_path_name(path)
  end

  def path
    "/files/#{html_file.filename}"
  end
end
