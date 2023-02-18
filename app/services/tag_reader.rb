# frozen_string_literal: true

# Parse the Tags from a md file
# I can get a tag hierarchy from:
# - manual managment / yml files
#
# - file paths <-- This is the way
class TagReader
  attr_accessor :filepath

  def initialize(filepath)
    self.filepath = filepath
  end

  # take the last element and set it as the associated tag
  # make sure all the other tags have this build up
  # private
end
