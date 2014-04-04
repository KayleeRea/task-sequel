require 'task_repository'
require 'sequel'

DB = Sequel.connect('postgres://gschool_user:password@localhost:5432/task_repository')


describe TaskRepository do
  before do
    DB.create_table! :tasks do
      primary_key :id
      String :name
      Boolean :complete
    end
  end

  it 'creates a new task' do
    tasks = TaskRepository.new(DB)
    tasks.create(name: 'name', complete: true)
    task = tasks.all
    expect(task).to eq(
                      [{:id => 1, :name => 'name', :complete => true}])
  end
end
