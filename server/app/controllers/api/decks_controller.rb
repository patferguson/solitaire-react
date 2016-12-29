module Api
  class DecksController < ApiController
    before_action :set_deck, only: [:show, :update, :destroy, :shuffle_deck]

    # GET /api/decks
    def index
      @decks = Deck.all

      render json: @decks.map { |deck| DeckSerializer.new(deck) }.as_json
    end

    # GET /api/decks/:id
    def show
      render json: DeckSerializer.new(@deck).as_json
    end

    # POST /api/decks
    def create
      @deck = Deck.new(deck_params)

      if @deck.save
        render json: DeckSerializer.new(@deck).as_json, status: :created, location: [:api, @deck]
      else
        render json: @deck.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/decks/:id
    def update
      if @deck.update(deck_params)
        render json: DeckSerializer.new(@deck).as_json
      else
        render json: @deck.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/decks/:id
    def destroy
      @deck.destroy
    end

    # POST /api/decks/:id/shuffle_deck
    def shuffle_deck
      @deck.cards.each do |card|
        # Re-random the sort order value of each card
        card.sort_weight = Card.random_sort_weight
      end
      @deck.save!

      render json: DeckSerializer.new(@deck).as_json
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
