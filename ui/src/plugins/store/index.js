import { createPinia } from '~/shared/deps'

export const setupStore = async (app) => {
    app.use(createPinia())
}
