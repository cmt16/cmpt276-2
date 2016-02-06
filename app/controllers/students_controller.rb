class StudentsController < ApplicationController
    
    def index
        @student = Student.new
        @students = Student.all
    end
    
    def new
        @student = Student.new
        @students = Student.all
    end

    def create
        @student = Student.new(student_info)
        if @student.save
            redirect_to '/students'
        end
    end
    
    def edit
        @person = Person.find(params[:id])
        #redirect_to '/students/edit'
    end
    
    def delete
        Student.find(params[:id]).destroy
        redirect_to action: '/students/index'
    end
    
    def view
        #redirect_to action: '/students/viewpeople'
    end
    
    def isNumber?
        self.to_f == self
    end
    
    private

    def student_info
        params.require(:student).permit(:name, :color, :weight, :height)
    end
    
end