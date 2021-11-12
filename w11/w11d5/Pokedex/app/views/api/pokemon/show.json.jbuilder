#json.set! @pokemon.id do 
#    json.id @pokemon.id
#    json.name @pokemon.name
#    json.attack @pokemon.attack
#    json.defense @pokemon.defense
#    json.poke_type @pokemon.poke_type
#    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}"
#end 

 json.pokemon do 
    json.set! @pokemon.id do 
        json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url
    end
end

json.moves do 
    @moves.each do |move|
        json.set! move.id do 
            json.extract! move, :id, :name
        end 
    end
end

json.items do 
    @items.each do |item|
        json.set! item.id do 
            json.extract! item, :id, :pokemon_id, :name, :price, :happiness, :image_url
        end
    end
end

