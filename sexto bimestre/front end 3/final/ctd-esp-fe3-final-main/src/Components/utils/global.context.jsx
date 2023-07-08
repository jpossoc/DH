import { useReducer } from "react";
import { useState } from "react";
import { createContext } from "react";

export const initialState = { theme: "light", data: [], getData: () => {} };

export const ContextGlobal = createContext(initialState);

export const ContextProvider = ({ children }) => {
  //Aqui deberan implementar la logica propia del Context, utilizando el hook useMemo

  const [theme, dispatchTheme] = useReducer(themeReducer, 'light');
  /**
 * @param state el estado antes del setState
 * @param action un objeto con las key type y payload
 * @param themeReducer funcion que se ejecuta cuando se hace un dispatch, retorna el nuevo estado
 */
  function themeReducer(state, action) {

    switch (action.type) {
      case "setThemeLight":
        return "light";

      case "setThemeDark":
        return "dark";

      default:
        throw new Error(`No se reconoce el type: ${action.type}`);
    }
  }

  const changueTheme = () => {
    if (theme === 'light') {
      dispatchTheme({ type: "setThemeDark", payload: theme.theme });
    } else{
      dispatchTheme({ type: "setThemeLight", payload: theme.theme });
    }
  };

  const [data, setdata] = useState();

  const getData = async () => {
    const reponse = await fetch("https://jsonplaceholder.typicode.com/users");
    const data1 = await reponse.json();
    setdata(data1);
  };

  const value = {
    ...initialState,
    theme: theme,
    data: data,
    getData: getData,
    changueTheme: changueTheme
  };

  return (
    <ContextGlobal.Provider value={value}>{children}</ContextGlobal.Provider>
  );
};
