class PagesResponder < BaseResponder
  include Webmate::Responders::Templates

  def index
    slim :index, layout: 'application'
  end
end
