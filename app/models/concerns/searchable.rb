module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    # Performs a full-text case insensitive search on the specified columns within
    # the table. At least one column should be passed, and they should be passed as symbols.
    # Returns an ActiveRecord::Relation object
    def search(term, *search_columns)
      raise ArgumentError if search_columns.count < 1
      term = "%#{term}%"
      query = search_columns.map { |c| "#{c} ILIKE :term" }
      where([query.join(" OR "), term: term])
    end
  end

end
