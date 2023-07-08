import React from "react";
import { useContext } from "react";
import { ContextGlobal } from "./utils/global.context";

const Footer = () => {
  const {theme} = useContext(ContextGlobal)
  return (
    <footer className={theme}>
      <div>
        <p>Powered by</p>
        <img src="../images/DH.png" alt="DH-logo" style={{ width: "200px"}}/>
      </div>
      <div>
        <img src="../images/ico-facebook.png" alt="Facebook icon" />
        <img src="../images/ico-instagram.png" alt="instagram icon" />
        <img src="../images/ico-tiktok.png" alt="tiktok icon" />
        <img src="../images/ico-whatsapp.png" alt="whatsapp icon" />
      </div>
    </footer>
  );
};

export default Footer;
