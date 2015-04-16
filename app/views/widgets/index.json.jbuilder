json.array!(@widgets) do |widget|
  json.extract! widget, :id, :page_id, :type, :link, :description, :name
  json.url widget_url(widget, format: :json)
end
