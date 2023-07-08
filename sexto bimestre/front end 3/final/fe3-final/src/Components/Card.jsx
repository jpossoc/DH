import React from "react";

const Card = ({ name, username, id }) => {
  const addFav = () => {
    const card = {
      name: name,
      username: username,
      id: id
    };
    const localStorageData = JSON.parse(localStorage.getItem("cards")) || [];
    const updatedData = localStorageData.concat(card);
    localStorage.setItem("cards", JSON.stringify(updatedData));
  };

  return (
      <div className="card">
        <h2>{name}</h2>
        <p>{username}</p>
        <p>{id}</p>
        <button onClick={addFav} className="favButton">
          Add fav
        </button>
      </div>
  );
};

export default Card;