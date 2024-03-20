import VueDOMPurifyHTML from 'vue-dompurify-html'

export const setupGlobal = async (app) => {
    app.use(VueDOMPurifyHTML)
}
