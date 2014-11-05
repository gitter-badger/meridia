module ApplicationHelper
  def sorteable (column, title= nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "ASC") ? "DESC" : "ASC"
    link_to title, params.merge(:sort => column, :direction => direction),id: column
  end
end
