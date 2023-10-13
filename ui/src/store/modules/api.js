import {defineStore} from '~/shared/deps'
import {getConfig, getTableList, getDbInfo} from '~/api'

const defaultState = {}

export const useApiStore = defineStore({
    id: 'store-api',
    state: () => ({...defaultState}),
    getters: {},
    actions: {
        /**** api get db tableList list ****/
        async getTableList(dbName) {
            return await getTableList(dbName)
        },
        /**** api get config ****/
        async getConfig() {
            return await getConfig()
        },
        /**** api get db info ****/
        async getDbInfo(dbName) {
            return await getDbInfo(dbName)
        }
    }
})
