import { useState } from "react";

const initialState = {
  name: "",
  email: ""
}

const Form = () => {
  //Aqui deberan implementar el form completo con sus validaciones



  const [formValues, setFormValues] = useState(initialState);
  const [input, setInput] = useState();
  const [validation, setvalidation] = useState(undefined)

  const {name, email} = formValues;

  const onChange = (event) => {
    const { name, value } = event.target;
    setInput({ ...input, [name]: value });
  }

  const onSubmit = (event) => {
    event.preventDefault();
    console.log(input.name.length);

    if(input.name.trim().length < 5 ) {
      setvalidation(false)
      return;
    };

    if(!input.email.includes(".")) {
      setvalidation(false)
      return;
    };

    setFormValues(input);
    setvalidation(true);
    //mejor en objeto TODO
    document.getElementById('myform').reset();
  }

  const textoError = "Por favor verifique su información nuevamente"

  return (
    <div>
      <form onSubmit={onSubmit} id="myform">
        <input type="text" name="name" id={name} placeholder="Full name" onChange={onChange}/>
        <input type="email" name="email" id={email} placeholder="Email" onChange={onChange}/>
        <button type="submit">Send</button>
      </form>
        {validation ? <div>Gracias {name}, te contactaremos cuando antes vía mail </div> : undefined}
        {validation === false ? <div>{textoError}</div> : undefined}
    </div>
  );
};

export default Form;
