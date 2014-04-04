require 'sequel'

class TaskRepository
  def initialize(db)
    @db = db
  end
  def create(task)
    tasks = @db[:tasks]
    tasks.insert(task)
  end

  def all
    tasks = @db[:tasks]
    tasks.to_a
  end
end