import {useMixStore} from '~/store'
import {openFullScreen, delay} from "~/shared/utils"
import {listenerRefreshHomePage} from '~/shared/emits'

export const useLayout = () => {
    const mixStore = useMixStore()

    const state = reactive({
        open: false,
        status: 0, // 0表示初始状态，1-表示接口正常返回，但没数据,2-有数据
    })

    const resetState = () => {
        state.open = false
        state.status = 0
    }

    const showEmptyPage = () => {
        return state.status === 1
    }

    const ready = async () => {
        resetState()
        await initConfig()
        if (!mixStore.dbName) {
            ElMessageBox.prompt('', '请输入数据库名称', {
                autofocus: true,
                closeOnClickModal: false,
                showClose: false,
                showCancelButton: false,
                confirmButtonText: '确认',
                inputPattern: /^\w+$/,
                inputErrorMessage: '无效的数据库名称',
                inputPlaceholder: '请输入数据库名称: 例如 legion_develop'
            }).then(async ({value}) => {
                mixStore.setDbName(value)
                await delay(600)
                ElMessageBox.close()
                await initData()
            })
        } else {
            await initData()
        }
    }

    const initConfig = async () => {
        await mixStore.initBackendConfig()
        document.title = mixStore.backendConfig.title
    }

    const initData = async () => {
        if (!mixStore.dbName) {
            return
        }

        const loading = await openFullScreen("加载中，请稍等...")
        await mixStore.initTableList(mixStore.dbName)
        await delay(600)
        loading.close()

        const tableList = mixStore.tableList
        if (tableList.length === 0) {
            state.status = 1
            state.open = false
            ElMessage.error('暂无信息')
        } else {
            state.status = 2
            state.open = true
        }
    }

    onMounted(async () => {
        await ready()
    })

    listenerRefreshHomePage(ready)
    return {
        state,
        showEmptyPage
    }
}