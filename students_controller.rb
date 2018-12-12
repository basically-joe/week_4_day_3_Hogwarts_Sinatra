require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
require('pry')
also_reload('./models/*')

# index

get "/students" do
  @students = Student.all()
  erb(:students)
end
# new
get "/students/new" do
  erb(:new)
end

# create
post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# show
get "/students/:id" do
  @student = Student.find(params[:id])
  erb(:show)
end


# edit

get "/students/:id/edit" do
  @student = Student.find(params[:id])
  erb(:edit)
end

post "/students/:id" do
  @student = Student.new(params)
  @student.update
  redirect to "/students"
end

# show

# update

# destroy
