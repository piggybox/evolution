# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def previous_icon
    '<img align="absmiddle" border="0" alt="Previous" src="/images/player_rev.png"/>'
  end

  def next_icon
    '<img align="absmiddle" border="0" alt="Next" src="/images/player_fwd.png"/>'
  end

  def bullet_icon
    '<img align="absmiddle" border="0" border="0" src="/images/nav_bullet.gif"/>' 
  end
end
