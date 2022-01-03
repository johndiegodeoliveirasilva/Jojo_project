class ExportsController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @pagy, @exports = pagy(@q.result(distinct: true).includes(cidade: :estado))
  end
end
