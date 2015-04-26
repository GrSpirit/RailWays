json.array!(@details) do |detail|
  json.extract! detail, :id, :name, :manufactured_at, :repaired_at, :detail_model_id
  json.url detail_url(detail, format: :json)
end
