require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :create_student
    redirect '/newcourse'
  end

  post "/student" do
    @student = Student.new(params[:student])
    params[:student][:courses].each do |details|
      Course.new(details)
    end
    @courses = Course.all
    erb :display_student
  end

  get '/newcourse' do
    erb :create_course
  end

end
