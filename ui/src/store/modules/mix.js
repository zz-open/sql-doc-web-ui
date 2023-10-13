import {defineStore} from '~/shared/deps'
import {useApiStore} from './api'

const defaultState = {
    dbName: "",
    backendConfig: undefined,
    tableList: [],
    tableCount: 0,
    openAppSettingDrawer: false
}

export const useMixStore = defineStore({
    id: 'store-mix',
    state: () => ({...defaultState}),
    getters: {},
    actions: {
        getQueryDbName(){
            let params = new URLSearchParams(window.location.search);
            return params.get('db_name')
        },
        setDbNameFromQuery(){
            this.dbName = this.getQueryDbName()
        },
        setDbName(dbName){
            this.dbName = dbName
        },
        async initTableList(dbName){
            const apiStore = useApiStore()
            this.tableList = await apiStore.getTableList(dbName)
            this.tableCount = this.tableList.length
        },
        async initBackendConfig(){
            const apiStore = useApiStore()
            this.backendConfig = await apiStore.getConfig()
        }
    }
})
