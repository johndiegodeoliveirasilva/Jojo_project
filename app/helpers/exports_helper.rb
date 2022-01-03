module ExportsHelper
  def states
    Estado.select(:id, :nome).order(:nome)
  end
end