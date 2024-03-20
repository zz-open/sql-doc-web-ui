import { emitter } from '../emitter'

import {
    EVENT_REFRESH_HOME_PAGE,
} from './event'

export function emitClear() {
    emitter.all.clear()
}

export const emitRefreshHomePage = () => {
    emitter.emit(EVENT_REFRESH_HOME_PAGE)
}

export const listenerRefreshHomePage = (p) => {
    emitter.on(EVENT_REFRESH_HOME_PAGE, p)
}