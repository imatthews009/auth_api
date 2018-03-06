class Invitation < ApplicationRecord
  enum status: %w(sent viewed accepted)
end
