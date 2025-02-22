class ItemsController < ApplicationController
    allow_unauthenticated_access only: %i[ index show ]
    before_action :set_item, only: %i[ show edit update destroy ]

    def index
        @items = Item.all
    end

    # View Single Item
    def show
    end

    # Create New Item
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to @item
        else
            render :new, status: :unprocessable_entity
        end
    end

    # Edit Item
    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to @item
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # Delete Item
    def destroy
        @item.destroy
        redirect_to items_path
    end

    private
    def set_item
        @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
        params.expect(item: [ :name, :description, :featured_image, :inventory_count ])
    end
end
