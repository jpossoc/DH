import React, from 'react'
import Card from '../Components/Card'
import {Link} from "react-router-dom";
import {useDoctStates} from "../Components/utils/global.context";
import Navbar from '../Components/Navbar'

//Este componente debera ser estilado como "dark" o "light" dependiendo del theme del Context

const Home = () => {
    const {DoctList} = useDoctStates()


  return (
    <main className="" >
        <h1>Home</h1>
        <div className='card-grid'>
          { DoctList.map(doc => (<Link key={doc.id} to={'/doc/' + doc.id}><Card data={doc} /></Link>))
          }
        </div>
    </main>
  )
}

export default Home