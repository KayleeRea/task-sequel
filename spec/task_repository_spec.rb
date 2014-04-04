require 'task_repository'
require 'sequel'

db = Sequel.connect('postgres://gschool_user:password@localhost:5432/task_repository')


describe TaskRepository do
  before do
    db.create_table! :tasks do
      primary_key :id
      String :name
      Boolean :complete
    end
    @tasks = TaskRepository.new(db)
  end

  it 'creates a new task' do
    @tasks.create(:name => 'homework', :complete => false)
    @tasks.create(name: 'grocery store', :complete => false)
    expect(@tasks.all).to eq(
                           [{:id => 1, :name => 'homework', :complete => false},
                            {:id => 2, :name => 'grocery store', :complete => false}])
  end

  it 'updates a task' do
    @tasks = TaskRepository.new(db)
    @tasks.create(name: 'homework', :complete => false)
    @tasks.update(1, :name => 'workout', :complete => true)
    expect(@tasks.all).to eq(
                           [{:id => 1, :name => 'workout', :complete => true}])
  end
end