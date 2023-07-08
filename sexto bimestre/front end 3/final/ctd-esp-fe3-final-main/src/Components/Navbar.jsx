import { useContext } from "react";
import { Link } from "react-router-dom";
import { ContextGlobal } from "./utils/global.context";

//Este componente debera ser estilado como "dark" o "light" dependiendo del theme del Context
 
const Navbar = () => {
  const { changueTheme, theme } = useContext(ContextGlobal);

  return (
    <nav className={theme}>
      {/* Aqui deberan agregar los liks correspondientes a las rutas definidas */}
      {/* Deberan implementar ademas la logica para cambiar de Theme con el button */}
      <div>
        <img src="./images/DH.png" alt="DH-logo" style={{ width: "250px"}} />
      </div>
      <div>
        <Link to="/home">Home</Link>
        <Link to="/contact">Contact</Link>
        <Link to="/favs">Favs</Link>
        <button onClick={changueTheme}>🌗</button>
      </div>
    </nav>
  );
};

export default Navbar;
