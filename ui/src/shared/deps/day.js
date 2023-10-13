import dayjs from 'dayjs'
import 'dayjs/locale/zh-cn'
import isLeapYear from 'dayjs/plugin/isLeapYear'
import duration from 'dayjs/plugin/duration'

dayjs.locale('zh-cn')
dayjs.extend(isLeapYear)
dayjs.extend(duration)
export {dayjs}