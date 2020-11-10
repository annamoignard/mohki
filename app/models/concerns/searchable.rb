module Searchable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def search_by(search_params)
      results = self.where(nil)
      search_params.each do |key, value|
        results = results.public_send("search_by_#{key}", value) if value.present?
      end
      results
    end
  end
end