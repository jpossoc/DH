import React from "react";

const Card = ({nombre, pasion, materiaFavorita}) => {

    let text = '';
    if (materiaFavorita == "Matematicas"){
        text = "el trinomio cuadrado no es tan perfecto comparado contigo"
    }
    else if (materiaFavorita == "Fisica"){
        text = "El amor es fisica, El matrimonio Quimica"
    }
    else if (materiaFavorita == "Lenguas"){
        text = "Nos dimos un verso y nos metimos en un grave poema"
    }
    else if (materiaFavorita == "Deporte"){
        text = "Todo lo negativo, es una oportunidad para crecer"
    }
    else if (materiaFavorita == "Biologia"){
        text = "Hay biologia en todo, incluso cuando se siente espiritual"
    }


    return (
        <div>
            <h3>{nombre} tu pasion es {pasion}</h3>
            <h3>

                {text}
            </h3>
        </div>
    )
};

export default Card;