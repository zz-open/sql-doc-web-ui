import { nowDateTimeStr } from './time'
import { isDev } from './env'
import { chalk } from '~/shared/deps'

function consoleLog(scope = 'log', ...msg) {
    if (isDev()) {
        console.log(
            `${chalk.bgGreenBright.whiteBright.white.red(nowDateTimeStr())} [${chalk.blueBright.bold(scope)}]:`,
            ...msg
        )
    }
}

export { consoleLog }