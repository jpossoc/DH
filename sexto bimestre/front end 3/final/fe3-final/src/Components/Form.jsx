import { useState } from "react";

const Form = () => {
    const [email, setEmail] = useState("");
    const [username, setUsername] = useState("");
    const [emailError, setEmailError] = useState("");
    const [usernameError, setUsernameError] = useState("");

    const handleEmailChange = (e) => {
        const value = e.target.value;
        setEmail(value);

        if (!value.includes("@")) {
            setEmailError("Por favor ingrese un correo electrónico válido");
        } else {
            setEmailError("");
        }
    };

    const handleUsernameChange = (e) => {
        const value = e.target.value;
        setUsername(value);

        if (value.length < 5) {
            setUsernameError("El nombre de usuario debe tener al menos 5 caracteres");
        } else {
            setUsernameError("");
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (!emailError && !usernameError) {
            console.log("Formulario enviado");
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <div>
                <label htmlFor="email">Correo electrónico</label>
                <input type="email" id="email" value={email} onChange={handleEmailChange} />
                {emailError && <p>{emailError}</p>}
            </div>
            <div>
                <label htmlFor="username">Nombre de usuario</label>
                <input type="text" id="username" value={username} onChange={handleUsernameChange} />
                {usernameError && <p>{usernameError}</p>}
            </div>
            <button type="submit">Enviar</button>
        </form>
    );
};

export default Form;

