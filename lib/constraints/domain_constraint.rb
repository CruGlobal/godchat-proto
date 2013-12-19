module Constraints
	class DomainConstraint

	  def initialize(domains)
      @domains = Array.wrap(domains).compact
	  end

	  def matches?(request)
      @domains.include? request.host
	  end
	end
end