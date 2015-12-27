class DashboardController < ApplicationController
  def index
    @documents = Document.all
  end
end
