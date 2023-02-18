require 'listen'

# Listen to fileSystem Changews in some dir
# This could actually be a singleton maybe
class FileListener
  attr_accessor(:listener)

  def initialize
    # NOTE: can add multiple dirs to Listen.to call
    # TODO: think about not hardcoding ./files
    listener = Listen.to('./files') do |modified, added, removed|
      added_path = FileManager.relative_path(added.first)
      puts "added path: " + added_path

      added_io = File.open(added_path)

      # puts "added io: " + added_io

      puts "Rails Root Path #{Rails.root}"
      puts "modified absolute path array: #{modified}"
      puts "added absolute path array: #{added}"
      puts "removed absolute path array: #{removed}"

      # TODO: Fix this error ( Message Verifier invalid Signature )

      # https://apidock.com/rails/v6.1.3.1/ActiveStorage/Blob/create_and_upload%21/class
      blobby = ActiveStorage::Blob.create_and_upload!(io: added_io, filename: added_path)
      pp blobby

      note = Note.new(title: 'test',
                      html_file: blobby)

      tag_hash = Tag.tags_for_path(added_path)
      tag = Tag.create(name: tag_hash[:tag])

      note.update(tag: tag)

      note.save
    end
    self.listener = listener
  end

  def processing?
    listener.processing?
  end

  def start
    listener.start
  end
end
