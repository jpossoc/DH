import React , { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

const Detail = () => {
    const [Doct, setDoct] = useState({})
    const { id } = useParams();
    const url = 'https://jsonplaceholder.typicode.com/users/' + id
    let favs = localStorage.getItem('favs')

    useEffect(() => {
        fetch(url)
            .then(response => response.json())
            .then(data => setDoct(data));
    }, [id]);

    if (!Doct) {
        return <div>Loading...</div>;
    }

    const addFav = () => {
        if (favs){
            let parsedDoct = JSON.parse(favs)
            favs= [...favs, Doct]
        }
        else{
            favs = [Doct]
        }
        localStorage.setItem('favs', JSON.stringify(Doct))
    }

    return (
        <>
            <h1>{Doct.name}</h1>
            <p>Email: {Doct.email}</p>
            <p>Phone: {Doct.phone}</p>
            <button onClick={addFav}>Favoritos</button>
        </>
    );
};

export default Detail;