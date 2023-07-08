import { Route, Routes } from "react-router-dom"
import Footer from "./Components/Footer";
import Navbar from "./Components/Navbar";
import Contact from "./Routes/Contact";
import Home from "./Routes/Home";
import Favs from "./Routes/Favs";


import {useDoctStates} from "./Components/utils/global.context";

function App() {
    const {themeState} = useDoctStates()
  return (
      <div className="App" style={{backgroundColor: themeState.bgColor, color:themeState.color}}>
          <Navbar/>
            <h1>Mas que solo bebidas, festejemos el encuentro.</h1>
            <Routes>
              <Route path='/' element={<Home/>}/>
              <Route path='/Contacto' element={<Contact/>}/>
              <Route path='/Favs' element={<Favs/>}/>
            </Routes>
          <Footer/>
      </div>
  );
}

export default App;
