import {setupGlobal} from './global'
import {setupError} from './error'
import {setupElementPlus} from './element-plus'
import {setupStore} from './store'

export const setupPlugins = async (app) => {
    await setupGlobal(app)
    await setupError(app)
    await setupStore(app)
    await setupElementPlus(app)
}