require 'spreadsheet'
class ExportJob < ApplicationJob
  queue_as :exports
  
  def perform(*guest)
    person = Spreadsheet::Workbook.new
    sheet1 = person.create_worksheet
    sheet1.row(0).concat Person.attribute_names.select{|t| !t.include?("_")}
    Person.select("id, name, age, email").each_with_index do |per, index|
      sheet1.row(index + 1).push(per.id, per.name, per.age, per.email)
    end
    create_folter
    person.write "/tmp/exports/export-#{DateTime.current.strftime("%Y%m%d%S%s")}.xls"
  end

  def create_folter
    Dir.mkdir('/tmp/exports') unless Dir.exist?('/tmp/exports')
  end
end
