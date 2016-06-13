class PagesController < ApplicationController

  def show
    render template: "pages/#{params[:id]}"
  rescue ActionView::MissingTemplate
    render template: "pages/404", status: 404
  end

end
