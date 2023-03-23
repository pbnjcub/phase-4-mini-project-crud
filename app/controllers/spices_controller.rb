class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: { error: 'Failed to create spice' }, status: :not_acceptable
        end
    end

    def update
        set_spice
        @spice.update(params.permit(:title, :image, :description, :notes, :rating))
        render json: @spice
    end

    def destroy
        set_spice
        @spice.destroy
    end


    private

    def set_spice
        @spice = Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end