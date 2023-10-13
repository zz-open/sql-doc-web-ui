import {axios} from "~/shared/deps"
import {getApiUrlPrefix, consoleLog} from "~/shared/utils"

export const getConfig = async (dbName) => {
    const _t =  Date.now()
    const url = `${getApiUrlPrefix()}/config/info?_t=${_t}`
    const res = await axios.get(url).catch((error) => {
        consoleLog('getConfig', error)
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