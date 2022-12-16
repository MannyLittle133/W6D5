class CatsController < ApplicationController
    def index
        @cats = Cats.all
        render :index
    end
    def create
        cats = Cats.new(cat_params)
        if cats.save
        redirect_to cat_url(@cat)
        else
            render json: cats.errors.full_messages, status: 422
        end
    end
    def show
        @cat = Cats.find(params[:id])
        render :show
    end
    def update
        @cat = Cats.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def edit 
        @cats = Cats.find_by(id: params[:id])
        render :edit
    end

    def new
        @cat = Cats.new
        render :new
    end
    private
    def cat_params
        params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
    end
end