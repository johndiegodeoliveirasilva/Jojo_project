class ExportsController < ApplicationController
  def index
    @pagy, @exports = pagy(Person.includes(cidade: :estado))
  end
end
