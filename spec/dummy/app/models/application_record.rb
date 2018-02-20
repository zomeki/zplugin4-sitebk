class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def table_name_prefix
      namespaces = name.split('::')
      namespaces[0..-2].map(&:underscore).join('_') + '_'
    end
  end
end
