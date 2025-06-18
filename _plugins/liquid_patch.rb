module Liquid
  module StandardFilters
    def escape(input)
      CGI.escapeHTML(input.to_s)
    end
  end
end
