require 'sequel'

class TaskRepository
  def initialize(db)
    @db = db
    @table = @db[:tasks]
  end
  def create(task)
    @table.insert(task)
  end

  def all
    @table.to_a
  end

  def update(id, task)
    @table.where(:id => id).update(task)
  end

  def find(id)
    @table.where(:id => id).to_a
  end

  def delete(id)
    @table.where(:id => id).delete
  end
end