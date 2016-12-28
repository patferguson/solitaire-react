module Api
  class CardsController < ApiController
    before_action :set_card, only: [:show, :update, :destroy, :attach_to_card]

    # GET /cards
    def index
      @cards = Card.all

      render json: @cards
    end

    # GET /cards/1
    def show
      render json: @card
    end

    # POST /cards
    def create
      @card = Card.new(card_params)

      if @card.save
        render json: @card, status: :created, location: [:api, @card]
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /cards/1
    def update
      if @card.update(card_params)
        render json: @card
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

    # DELETE /cards/1
    def destroy
      @card.destroy
    end

    # POST /cards/1/attach_to_card/2
    def attach_to_card
      new_parent_card = Card.find_by_id(params[:parent_card_id])

      if new_parent_card
        @card.parent_card = new_parent_card
        if @card.save
          render json: @card, status: :ok, location: [:api, @card]
        else
          render json: @card.errors, status: :unprocessable_entity
        end
      else
        render json: {new_parent_card: "couldn't find new parent card id, retaining original parent"}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_card
        @card = Card.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def card_params
        params.require(:card).permit(:suit, :face_value, :is_flipped_up, :parent_card, :child_card)
      end
  end
end