class Ability
  include CanCan::Ability

  def initializer(user)
    if user && user.admin?
      can :manage, :all
      return
    end

    can %i(read show index), Study do |study|
      study.accepted? || study.author == user
    end
    can %i(update edit destroy submit_for_review), Study do
      study.draft? && study.author == user
    end
    can :duplicate do
      study.author == user
    end
  end
end
