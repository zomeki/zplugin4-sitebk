module Zplugin
  module Sitebk
    class Loader
      class << self
        def target_models
          return @@target_models if defined? @@target_models

          Rails.application.eager_load!
          klasses = ActiveRecord::Base.descendants.select { |klass| klass.respond_to?(:in_site) }
          klasses.select! { |klass| ((klass.ancestors - [klass]) & klasses).empty? }
          @@target_models = klasses.sort_by(&:name)
        end
      end
    end
  end
end
