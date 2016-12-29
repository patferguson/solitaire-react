module Api
  class CardsController < ApiController
    before_action :set_card, only: [:show, :update, :destroy, :attach_to_card]

    # GET /api/cards
    def index
      @cards = Card.all

      render json: @cards.map { |card| CardSerializer.new(card) }.as_json
    end

    # GET /api/cards/:id
    def show
      render json: CardSerializer.new(@card).as_json
    end

    # POST /api/cards
    def create
      @card = Card.new(card_params)

      if @card.save
        render json: CardSerializer.new(@card).as_json, status: :created, location: [:api, @card]
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/cards/:id
    def update
      if @card.update(card_params)
        render json: CardSerializer.new(@card).as_json
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/cards/:id
    def destroy
      @card.destroy
    end

    # POST /api/cards/:id/attach_to_card/:parent_card_id
    def attach_to_card
      new_parent_card = Card.find_by_id(params[:parent_card_id])

      if new_parent_card
        @card.parent_card = new_parent_card
        if @card.save
          render json: CardSerializer.new(@card).as_json, status: :ok, location: [:api, @card]
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
