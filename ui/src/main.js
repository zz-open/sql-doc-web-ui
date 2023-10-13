import { createApp } from 'vue'
import App from './App.vue'
import { setupPlugins } from '~/plugins'

const app = createApp(App)
const bootstrap = async () => {
    await setupPlugins(app)
    app.mount('#app')
}

await bootstrap()