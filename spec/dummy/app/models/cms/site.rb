class Cms::Site < ApplicationRecord
  scope :in_site, ->(site) { where(id: site) }
end
