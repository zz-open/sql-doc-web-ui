export const getApiUrlPrefix = () => {
    if (import.meta.env.DEV) {
        return `${window.location.protocol}//${window.location.hostname}:7654/api`
    }
    
    return `${window.location.protocol}//${window.location.host}/api`
}

export const textDefault = (val) => {
    return isEmptyVal(val) ? '-' : val;
}

export const isEmptyVal = (val) =>  {
    if (isUndefined(val)){
        return true;
    }

    let stringify = JSON.stringify(val);
    return -1 !== ['""', '[]', '{}'].indexOf(stringify) || stringify.trim() === "";
};

export const isUndefined = (val) => {
    return val === undefined
}