module Constraints
	class DomainConstraint

	  def initialize(domain)
	    @domain = domain
	  end

	  def matches?(request)
	    @domain.include? request.domain
	  end
	end
end