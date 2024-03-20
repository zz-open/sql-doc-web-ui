import {axios} from "~/shared/deps";
import {getApiUrlPrefix, consoleLog} from "~/shared/utils"

export const getTableList = async (dbName) => {
    if (!dbName) {
        return []
    }

    const _t =  Date.now()
    const url = `${getApiUrlPrefix()}/table/list?db_name=${dbName}&_t=${_t}`
    const res = await axios.get(url).catch((error) => {
        consoleLog('getTableList', error)
        return null
    });

    if (!res) {
        return []
    }

    if (res.data['code'] === '1') {
        return []
    }

    if (Array.isArray(res.data.data)) {
        return res.data.data
    }

    return []
}

export const getDbInfo = async (dbName) => {
    if (!dbName) {
        return undefined
    }

    const _t = Date.now()
    const url = `${getApiUrlPrefix()}/db/info?db_name=${dbName}&_t=${_t}`
    const res = await axios.get(url).catch((error) => {
        consoleLog('getDbInfo', error)
        return undefined
    });

    if (!res) {
        return undefined
    }

    if (res.data['code'] === '1') {
        return undefined
    }

    if (!res.data.data) {
        return undefined
    }

    return res.data.data
}