class StaticPagesController < ApplicationController
  def home
  	@titre = "Accueil"
  end

  def help
  	@titre = "Aide"
  end

  def about
  	@titre = "A propos"
  end

  def contact
  	@titre = "Contact"
  end
end
