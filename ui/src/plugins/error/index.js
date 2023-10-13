export const setupError = async (app) => {
    app.config.errorHandler = (err) => {
        if (!err) {
            return
        }

        console.error('====== 有报错了兄弟!!! ======', err)
        if (err instanceof Error) {
            console.error('❌ 提示:', err.message)
        }
    }
}
