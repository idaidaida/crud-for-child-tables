class SchoolsController < ApplicationController

    def index
        p "#############enter"
        @schools = School.all
    end

    def new
        @school = School.new
        
        # 追加したい生徒の数だけbuildする
        # 数を変更してもView側の変更は不要
        3.times do
            @school.students.build
        end

    end

    def create
        @school = School.new(params_create)
        if @school.save
            redirect_to root_url
        else
            render "new"
        end
    end

    def edit
        @school = School.find(params[:id])
        (3-@school.students.count).times do
            @school.students.build
        end
    end 

    def update
        @school = School.find(params[:id])
        if @school && @school.update_attributes(params_update)
            redirect_to root_url
        else
            render "edit"
        end
    end

    def destroy
        @school = School.find(params[:id])
        @school.destroy
        redirect_to root_url
    end

    private
        def params_create
            params.require(:school).permit(:name,students_attributes:[:name,:id])
        end
        
        def params_update
            # idを忘れないこと
            params.require(:school).permit(:name,students_attributes:[:name,:id])
        end
end
