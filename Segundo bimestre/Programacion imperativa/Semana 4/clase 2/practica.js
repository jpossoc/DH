let arrayCuentas = [
    {
      nroCuenta: 5486273622,
      tipoDeCuenta: "Cuenta Corriente",
      saldoEnPesos: 27771,
      titularCuenta: "Abigael Natte",
    },
    {
      nroCuenta: 1183971869,
      tipoDeCuenta: "Caja de Ahorro",
      saldoEnPesos: 8675,
      titularCuenta: "Ramon Connell",
    },
    {
      nroCuenta: 9582019689,
      tipoDeCuenta: "Caja de Ahorro",
      saldoEnPesos: 27363,
      titularCuenta: "Jarret Lafuente",
    },
    {
      nroCuenta: 1761924656,
      tipoDeCuenta: "Cuenta Corriente",
      saldoEnPesos: 32415,
      titularCuenta: "Ansel Ardley",
    },
    {
      nroCuenta: 7401971607,
      tipoDeCuenta: "Cuenta Unica",
      saldoEnPesos: 18789,
      titularCuenta: "Jacki Shurmer",
    },
];
let banco = {
    clientes: arrayCuentas,
    consultarCliente: function (titular) {
        for (let i = 0; i < this.clientes.length; i++) {
            if (titular==this.clientes[i].titularCuenta){
                return this.clientes[i];
            }
        }
    },
    deposito: function (titular,CantidadDinero) {
        let consultaCliente=this.consultarCliente(titular);
        let saldo=consultaCliente.saldoEnPesos+CantidadDinero
        return 'deposito realizado su nuevo saldo es: '+ saldo
    },
    extraccion:  function (titular,MontoExtraer) {
        let consultaCliente=this.consultarCliente(titular);
            consultaCliente.saldoEnPesos=consultaCliente.saldoEnPesos-MontoExtraer
        if (consultaCliente.saldoEnPesos>0){
            return 'extraccion realizada correctamente su nuevo saldo es: '+ consultaCliente.saldoEnPesos
        }
        else {
            return 'fondos insuficientes'
        }
    }
}

