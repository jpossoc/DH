import {createContext, useContext, useEffect, useMemo, useReducer, useState} from "react";

export const DoctStates = createContext();

const themes = {
    dark: {
        theme: false,
        bgColor: "black",
        color: "white",
    },
    light: {
        theme: true,
        bgColor: "white",
        color: "black",
    },
};

export const initialThemeState = themes.light;

const themeReducer = (state, action) => {
    switch (action.type) {
        case "SWITCH_DARK":
            return themes.dark;
        case "SWITCH_LIGHT":
            return themes.light;
        default:
            throw new Error();
    }
};

export const ContextProvider = ({ children }) => {
    const [doctList, setDoctList] = useState([]);
    const url = "https://jsonplaceholder.typicode.com/users/";
    const [themeState, themeDispatch] = useReducer(themeReducer, initialThemeState);

    const memoizedValue = useMemo(() => {
        return { doctList, setDoctList };
    }, [doctList]);

    const memoizedThemeState = useMemo(() => {
        return { themeState, themeDispatch };
    }, [themeState]);

    useEffect(() => {
        const fetchDoct = async () => {
            let res = await fetch(url);
            let data = await res.json();
            setDoctList(data.results);
        };
        fetchDoct();
    }, []);

    return (
        <DoctStates.Provider value={memoizedValue}>
            {children}
        </DoctStates.Provider>
    );
};

export default ContextProvider;

export const useDoctStates = () => useContext(DoctStates)
