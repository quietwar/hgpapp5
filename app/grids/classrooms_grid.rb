class ClassroomsGrid

  include Datagrid

  scope do
    Cohort
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:cohort)
  column(:genius)
  column(:email)
  column(:cell)
  column(:stipend)
  column(:completed)
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
