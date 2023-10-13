export const getApiUrlPrefix = () => {
    // return `${window.location.protocol}//${window.location.host}/api`
    return `${window.location.protocol}//localhost:7654/api`
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