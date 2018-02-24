module Zplugin
  module Sitebk
    class Scanner
      def initialize(site)
        @site = site
        @models = Sitebk::Loader.target_models
      end

      def scan_ids
        @models.each_with_object(HashWithIndifferentAccess.new) do |model, hash|
          hash[model.table_name] = model.unscoped
                                        .in_site(@site)
                                        .reorder(model.primary_key)
                                        .pluck(model.primary_key)
        end
      end
    end
  end
end
