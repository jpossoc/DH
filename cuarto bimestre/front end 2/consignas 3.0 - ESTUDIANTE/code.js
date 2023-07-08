/* --------------------------- NO TOCAR DESDE ACÁ --------------------------- */
let datosPersona = {
  nombre: "",
  edad: 0,
  ciudad: "",
  interesPorJs: "",
};

const listado = [{
    imgUrl: "https://huguidugui.files.wordpress.com/2015/03/html1.png",
    lenguajes: "HTML y CSS",
    bimestre: "1er bimestre",
  },
  {
    imgUrl: "https://jherax.files.wordpress.com/2018/08/javascript_logo.png",
    lenguajes: "Javascript",
    bimestre: "2do bimestre",
  },
  {
    imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/React.svg/1200px-React.svg.png",
    lenguajes: "React JS",
    bimestre: "3er bimestre",
  },
];

const profileBtn = document.querySelector("#completar-perfil");
const materiasBtn = document.querySelector("#obtener-materias");
const verMasBtn = document.querySelector("#ver-mas");
const cambiarTema = document.querySelector('#cambiar-tema');

profileBtn.addEventListener("click", renderizarDatosUsuario);
materiasBtn.addEventListener("click", recorrerListadoYRenderizarTarjetas);
cambiarTema.addEventListener("click", alternarColorTema);
/* --------------------------- NO TOCAR HASTA ACÁ --------------------------- */

function obtenerDatosDelUsuario() {
  /* --------------- PUNTO 1: Escribe tu codigo a partir de aqui --------------- */
 datosPersona.nombre = prompt("por favor introduzca su nombre");
 anioNacimiento = parseInt(prompt("por favor introduzca el año de nacimiento"));
 if (isNaN(anioNacimiento)){
     datosPersona.edad = "no introdujo un año"
 }
 else {
     datosPersona.edad = 2022 - anioNacimiento;
 }
 datosPersona.ciudad = prompt("por favor introduzca su ciudad");
 datosPersona.interesPorJs = confirm("le interesa javascript?");
 return datosPersona
}

function renderizarDatosUsuario() {
  /* ------------------- NO TOCAR NI ELIMINAR ESTA FUNCION. ------------------- */
  obtenerDatosDelUsuario();
  /* --------------- PUNTO 2: Escribe tu codigo a partir de aqui --------------- */
  const nombre = document.getElementById("nombre");
  nombre.innerText = datosPersona.nombre;
  const edad = document.getElementById("edad");
  edad.innerText = datosPersona.edad;
  const ciudad = document.getElementById("ciudad");
  ciudad.innerText = datosPersona.ciudad;
  const javascript = document.getElementById("javascript");
  if (datosPersona.interesPorJs == true){
      javascript.innerText = "Si";
  }
  else{
      javascript.innerText = "No";
  }
}

let barrera = true;
function recorrerListadoYRenderizarTarjetas() {
  /* ------------------ PUNTO 3: Escribe tu codigo desde aqui ------------------ */
    if (barrera == true ){
        for (let i = 0; i < listado.length ; i++){
            const newsElement = document.createElement("div");
            newsElement.classList.add("caja");
            newsElement.innerHTML = `
        <img src="${listado[i].imgUrl}" alt="${listado[i].lenguajes}">
        <h3 class = "Lenguajes">lenguajes: ${listado[i].lenguajes}</h3>
        <h3 class = "Bimestre" >bimestre: ${listado[i].bimestre}</h3>
    `;
            document.getElementById("fila").appendChild(newsElement)
        }
        barrera = false;
    }
}

function alternarColorTema() {
  /* --------------------- PUNTO 4: Escribe tu codigo aqui --------------------- */
    botonOscuro = document.querySelector("#sitio");
    botonOscuro.classList.toggle("dark")

}

/* --------------------- PUNTO 5: Escribe tu codigo aqui --------------------- */
function presionarF (event){
    oculto = document.getElementById("sobre-mi")
    teclaF = event.key;
    if (teclaF === "f" || teclaF === "F"){
        oculto.classList.remove("oculto");
    }
}
window.onkeypress = presionarF