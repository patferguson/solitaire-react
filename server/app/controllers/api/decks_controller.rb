module Api
  class DecksController < ApiController
    before_action :set_deck, only: [:show, :update, :destroy, :shuffle_deck]

    # GET /decks
    def index
      @decks = Deck.all

      render json: @decks
    end

    # GET /decks/1
    def show
      render json: @deck
    end

    # POST /decks
    def create
      @deck = Deck.new(deck_params)

      if @deck.save
        render json: @deck, status: :created, location: [:api, @deck]
      else
        render json: @deck.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /decks/1
    def update
      if @deck.update(deck_params)
        render json: @deck
      else
        render json: @deck.errors, status: :unprocessable_entity
      end
    end

    # DELETE /decks/1
    def destroy
      @deck.destroy
    end

    # POST /decks/1/shuffle_deck
    def shuffle_deck
      @deck.cards.each do |card|
        # Re-random the sort order value of each card
        card.sort_weight = Card.random_sort_weight
      end
      @deck.save!

      render json: @deck
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_deck
        @deck = Deck.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def deck_params
        params.require(:deck).permit(:cards_attributes => [:suit, :face_value, :is_flipped_up])
      end
  end
end
