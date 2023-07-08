import React, {useState} from "react";
import Card from "./Card";

const Form = () => {
    const [user, setUser] = useState({
        nombre: '',
        pasion: '',
        materiaFavorita: ''
    })
    const [show, setShow] = useState(false)
    const [err, setErr] = useState(false)

    const handleSubmit = (event) => {
        event.preventDefault()
        if(user.nombre.length > 3 && user.nombre[0] !== ' ' && user.pasion.length >= 6){
            setShow(true)
            setErr(false)
        } else {
            setShow(false)
            setErr(true)
        }
    }
    return <div>
        <form onSubmit={handleSubmit}>
            <label>Nombre</label>
            <input type="text" value={user.nombre} onChange={(e) => setUser({...user, nombre: e.target.value})}/>
            <label>Pasion</label>
            <input type="text" value={user.pasion} onChange={(e) => setUser({...user, pasion: e.target.value})}/>
            <select value={user.materiaFavorita} onChange={(e) => setUser({...user, materiaFavorita: e.target.value})}>
                <option value="">Seleccione su materia favorita</option>
                <option value="Matematicas">Matematicas</option>
                <option value="Fisica">Fisica</option>
                <option value="Lenguas">Lenguas</option>
                <option value="Deporte">Deporte</option>
                <option value="Biologia">Biologia</option>
            </select>
            <button>Enviar</button>
        </form>
        {err ? 'Por favor chequea que la informacion es correcta' : null}
        {show && <Card nombre={user.nombre} pasion={user.pasion} materiaFavorita={user.materiaFavorita}/>}


    </div>
};

export default Form;