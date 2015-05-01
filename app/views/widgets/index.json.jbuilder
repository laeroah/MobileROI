json.array!(@widgets) do |widget|
  json.extract! widget, :id, :page_id, :type, :link, :description, :name, :x, :y, :width, :height, :widgets
  json.url project_page_widgets_url(widget, format: :json)
end
