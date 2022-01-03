module ExportsHelper
  def states
    Estado.order(:nome).pluck(:nome, :id)
  end
end