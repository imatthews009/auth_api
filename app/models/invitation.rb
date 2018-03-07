class Invitation < ApplicationRecord
  enum status: %w(sent viewed accepted)

  validates_uniqueness_of   :email
end
