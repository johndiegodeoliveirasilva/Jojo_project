class ExportsController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @pagy, @exports = pagy(@q.result(distinct: true).includes(cidade: :estado))

    respond_to do |format|
      format.html
    end
  end

  def export_xls
    100.times do |_|
      ExportJob.perform_later
    end
  end
end
