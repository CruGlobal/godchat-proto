class Ablity
	include CanCan::Ability

	def initialize(user)
		can :manage, :all if user.is? :admin
	end
end