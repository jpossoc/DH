import { useContext } from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import { ContextGlobal } from "./Components/utils/global.context";
import {Contact, Favs, Detail, Home}  from "./Routes";
import Footer from "./Components/Footer";
import Navbar from "./Components/Navbar";

function App() {

  const {theme} = useContext(ContextGlobal)
  
  return (
    <div className={`App ${theme}`}>
        <Navbar />
        <Routes>
          <Route path="/home" element={<Home />} />
          <Route path="/*" element={<Navigate to="/home" />} />
          <Route path="favs" element={<Favs />} />
          <Route path="dentist/:id" element={<Detail />} />
          <Route path="contact" element={<Contact />} />
        </Routes>
        <Footer />
    </div>
  );
}

export default App;
