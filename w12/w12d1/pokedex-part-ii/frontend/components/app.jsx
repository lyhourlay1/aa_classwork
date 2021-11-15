import { Route } from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import React from "react";

const App = () => (
  <Route path="/" component={PokemonIndexContainer} />
)

export default App