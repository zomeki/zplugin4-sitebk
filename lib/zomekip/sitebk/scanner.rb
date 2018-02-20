module Zomekip
  module Sitebk
    class Scanner
      def initialize(site)
        @site = site
        @models = Zomekip::Sitebk::Loader.target_models
      end

      def scan_ids
        @models.each_with_object(HashWithIndifferentAccess.new) do |model, hash|
          hash[model.table_name] = model.in_site(@site)
                                        .order(model.primary_key)
                                        .pluck(model.primary_key)
        end
      end
    end
  end
end
