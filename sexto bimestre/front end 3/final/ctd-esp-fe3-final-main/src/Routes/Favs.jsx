import Card from "../Components/Card";

//Este componente debera ser estilado como "dark" o "light" dependiendo del theme del Context

export const Favs = () => {
  const storage = JSON.parse(localStorage.getItem("favs"))

  return (
    <>
      <h1>Dentists Favs</h1>
      <div className="card-grid">
        {/* este componente debe consumir los destacados del localStorage */}
        {/* Deberan renderizar una Card por cada uno de ellos */}
        
        { storage ? storage.map((dentist)=>(<Card key={dentist.id} item={dentist}/>)) : undefined}
      </div>
    </>
  );
};
