import React, { useContext } from "react";
import { useDoctStates} from "./utils/global.context";
import { Link } from 'react-router-dom'

const Navbar = () => {
    const { themeState, themeDispatch } = useDoctStates();

    const switchTheme = () => {
        if (themeState.theme){
            themeDispatch({type: 'SWITCH_DARK'})
        }
        else {
            themeDispatch({type: 'SWITCH_LIGHT'})
        }

    }

  return (
    <nav>
      {/* Aqui deberan agregar los liks correspondientes a las rutas definidas */}
        <Link to='/'>Home</Link>
        <Link to='/Contact'>Contacto</Link>
        <Link to='/Favs'>Favoritos</Link>
        <Link to='/Detail/:id'>Detalles</Link>

        <button onClick={switchTheme}>{themeState.theme ? 'Dark' : 'Light'}</button>
    </nav>
  )
}

export default Navbar