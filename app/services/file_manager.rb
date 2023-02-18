# frozen_string_literal: true

require 'pandoc-ruby'

# Handles files and placing them somewhere
class FileManager
  attr_accessor(:context_dir, :file_name)

  def initialize(context_dir, file_name)
    self.context_dir = context_dir
    self.file_name = file_name
  end

  def read_file
    File.read(file_name)
  end
  # TODO: save_file(context_dir, file_name)

  def markdown?
    File.fnmatch('**.md', file_name)
  end

  # TODO: move this somewhere else
  def convert_to_html
    # TODO: get a solution that works with active storage blobs
    #
    # raise 'tried converting non markdown file' unless markdown?
    #
    # Active Storage Blobs have a content_type -> 'text/markdown'

    pandoc_html = PandocRuby.convert(read_file, from: :markdown, to: :html)
    File.write("./files/#{SecureRandom.uuid}.html", pandoc_html)

    pandoc_html
  end

  # return array of context_dir and filename to splat
  # when creating FM on active_storage blob
  def self.seperate_path_name(filepath)
    array = File.split(filepath)
    array[0] = ".#{array[0]}" # HACK: on app root dir
    array
  end

  def self.relative_path(filepath)
    filepath.gsub(/#{Rails.root}/, '.').to_s
  end
end
