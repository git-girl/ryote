# frozen_string_literal: true

# These are very close to UI representations of Notes i take
class Note < ApplicationRecord
  has_one_attached :html_file
  # TODO: add a tag migration

  def name
    name = created_at.to_s unless title.present?
    name = title
    name = "The nameless note" unless name.present?
  end
end
