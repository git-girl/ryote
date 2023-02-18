# frozen_string_literal: true

# Runs pandoc against a file
class PandocRunner
  attr_accessor(:file)

  def initialize(file)
    raise 'cant run pandoc filetype isnt markdown' unless FileManager.markdown?(file)
    self.file = file
  end
  
end
