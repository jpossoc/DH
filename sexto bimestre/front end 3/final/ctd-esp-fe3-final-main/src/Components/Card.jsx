import { Link } from "react-router-dom";

const Card = ({item}) => {
  const {name, username, id} = item;

  const addFav = () => {
    // Aqui iria la logica para agregar la Card en el localStorage
    const storage = localStorage.getItem("favs");
    const listFavs = storage ? JSON.parse(storage) : [];

    const validacion = listFavs.some((fav) => fav.id === item.id);
    if(validacion) return;  

    listFavs.push({ id: item.id, username:item.username, name: item.name });
    localStorage.setItem('favs', JSON.stringify(listFavs));
    alert("Dentist added");
  }

  return (
    <div className="card">
      {/* En cada card deberan mostrar en name - username y el id */}
      {/* No debes olvidar que la Card a su vez servira como Link hacia la pagina de detalle */}
      {/* Ademas deberan integrar la logica para guardar cada Card en el localStorage */}
        <Link to={`/dentist/${id}`}>
          <img src="./images/doctor.jpg" alt="Doctor" style={{width: "200px"}}></img>
          <h3>{name}</h3>
          <h4>{username}, Id: {id}</h4>
        </Link>
        <button onClick={()=>addFav()} className="favButton">⭐ Add fav ⭐</button>
    </div>
  );
};

export default Card;
