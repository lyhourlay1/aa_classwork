class Api::PokemonController < ApplicationController
    def index
        @pokemons = Pokemon.all 
        render :index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        @poke_moves = PokeMove.where(pokemon_id: params[:id])
        
        @moves = []
        @poke_moves.each do |poke_move| 
            @moves.push(Move.find(poke_move.move_id))
        end

        @items = Item.where(pokemon_id: params[:id])
        
        render :show
    end

end
