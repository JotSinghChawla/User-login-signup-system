json.extract! employee, :id, :name, :designation, :salary, :experience, :created_at, :updated_at
json.url employee_url(employee, format: :json)
