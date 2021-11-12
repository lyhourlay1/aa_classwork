#json.set! @pokemon.id do 
#    json.id @pokemon.id
#    json.name @pokemon.name
#    json.attack @pokemon.attack
#    json.defense @pokemon.defense
#    json.poke_type @pokemon.poke_type
#    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}"
#end 

 
json.set! @pokemon.id do 
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url
end
    json.moves
