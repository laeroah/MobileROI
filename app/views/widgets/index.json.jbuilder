json.array!(@widgets) do |widget|
  json.extract! widget, :id, :page_id, :type, :link, :description, :name, :x, :y, :width, :height
  json.url widget_url(widget, format: :json)
end
