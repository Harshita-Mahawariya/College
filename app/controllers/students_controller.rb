class StudentsController < ApplicationController
	def index
		@students = Student.all
	end
	
	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path
		else
			flash[:message] = "Try Again"
		end
	end

	def show
		@student = Student.find_by(id: params[:id])
	end

	def edit
		@student = Student.find_by(id: params[:id])
	end

	def update
		@student = Student.find_by(id: params[:id])
		@student.update(student_params)
		if @student.save
			redirect_to student_path(params[:id])
		else
			flash[:message] = 'Try Again'
		end
	end

	def destroy
		@student = Student.find_by(id: params[:id])
		if @student.destroy
			redirect_to students_path
		else
			flash[:message] = 'Try Again'
		end
	end

	def search
		if params[:search].blank?
			redirect_to students_path and return
		else
			@param = params[:search].downcase
			byebug
			@results = Student.all.where("lower(name) LIKE :search", search: "%#{@param}%")
			if @results.blank?
				redirect_to students_path and return
			end
		end
	end
	
	private
	def student_params
		params.require(:student).permit!
	end
end
