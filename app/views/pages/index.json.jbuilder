json.array!(@pages) do |page|
  json.extract! page, :id, :project_id, :name, :image, :width, :height, :widgets
  json.url project_pages_url(page, format: :json)
end
