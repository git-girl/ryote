# frozen_string_literal: true

# These are very close to UI representations of Notes i take
class Note < ApplicationRecord
  has_one_attached :html_file
  # TODO: add a tag migration

  def title
    title || created_at.to_s
  end
end
