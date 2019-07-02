class SchoolclassesController < ApplicationController
    
    def new
        @schoolclass = Schoolclass.new
    end

    def create
        @schoolclass = Schoolclass.create(params.require(:schoolclass).permit(:title,:room_number))
        redirect_to @schoolclass
    end

    def show
        @schoolclass = Schoolclass.find(params[:id])
    end

    def edit
        @schoolclass = Schoolclass.find(params[:id])
    end

    def update
        @schoolclass = Schoolclass.find(params[:id])
        @schoolclass.update(params.require(:schoolclass).permit(:title,:room_number))
        redirect_to @schoolclass
    end
end