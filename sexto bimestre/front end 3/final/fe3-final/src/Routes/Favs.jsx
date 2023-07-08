import React from "react";
import Card from "../Components/Card";

const Favs = () => {
    const favs = JSON.parse(localStorage.getItem("favs"));

    return (
        <>
            {favs.map(Doct => (
                <div>
                    <h1>Doctor Favs</h1>
                    <img className='imgdoctor' src="../../public/images/doctor.jpg" alt="" />
                    <h3>{Doct.name}</h3>
                    <h4>{Doct.username}</h4>
                    <p>{Doct.ip}</p>
                </div>
            ))}
        </>
    );
}

export default Favs;