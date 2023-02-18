# frozen_string_literal: true

# Tags are tags dugh..
# Each Tag maintains its parent as :parent_tag
# this way you can always go up and ask for siblings
class Tag < ApplicationRecord
  has_one :parent_tag, class_name: 'Tag'
  has_many :notes, class_name: 'Note'

  # TODO: write a method that checks if a 
  # tag already exsits within the context of 
  # the tag structure
  # -> Tree DataStructure that maintains Tags

  # return the tag for the file
  # but also trigger checks that all its parent tags 
  # are created
  def self.tag_and_structure_for(filepath)
    puts 'TagReader Start'
    taglist = filepath.split('/')
    puts "Taglist: #{taglist}"

    { taglist: taglist,
      tag: taglist[taglist.length - 2] }
  end
end
