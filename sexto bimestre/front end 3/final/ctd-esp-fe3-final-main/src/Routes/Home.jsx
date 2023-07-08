import React, { useEffect, useContext } from "react";
import Card from "../Components/Card";
import { ContextGlobal } from "../Components/utils/global.context";

//Este componente debera ser estilado como "dark" o "light" dependiendo del theme del Context

export const Home = () => {
  const {data, getData} = useContext(ContextGlobal);
  console.log(data);

  useEffect (() => {
    getData();
  }, []);

  return (
    <main className="">
      <h1>Home</h1>
      <div className="card-grid">
        {/* Aqui deberias renderizar las cards */}
       {data ? data.map((eachOne)=>(<Card key={eachOne.id} item={eachOne}/>)) : undefined}
      </div>
    </main>
  );
};
