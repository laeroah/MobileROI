json.array!(@pages) do |page|
  json.extract! page, :id, :project_id, :name, :background
  json.url page_url(page, format: :json)
end