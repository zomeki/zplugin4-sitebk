class Cms::Content < ApplicationRecord
  scope :in_site, ->(site) { where(site_id: site) }
end
