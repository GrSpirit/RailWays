json.array!(@defects) do |defect|
  json.extract! defect, :id, :description, :detail_id, :wagon_id, :registered_at
  json.url defect_url(defect, format: :json)
end
