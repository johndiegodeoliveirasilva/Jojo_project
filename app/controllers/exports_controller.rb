class ExportsController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @pagy, @exports = pagy(@q.result(distinct: true).includes(cidade: :estado))
    @pagy.count.times.each do |_|
    ExportJob.perform_later
    end
  end
end
