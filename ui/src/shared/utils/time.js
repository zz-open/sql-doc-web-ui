import { dayjs } from '~/shared/deps/day'

export const nowDateTimeStr = () => {
    return dayjs().format('YYYY-MM-DD HH:mm:ss')
}

export const nowDateTimeNoSecondStr = () => {
    return dayjs().format('YYYY-MM-DD HH:mm')
}

export const nowDateStr = () => {
    return dayjs().format('YYYY-MM-DD')
}

export const delay = (time) => {
    return new Promise((resolve) => setTimeout(resolve, time))
}

// 单位：秒
export const countdownFormat = (duration) => {
    if (!duration) {
        return ""
    }

    let diffTime = dayjs.duration(duration * 1000);
    let year     = diffTime.years();  //年
    let month    = diffTime.months(); //月
    let day      = diffTime.days();   //天
    let hour    = diffTime.hours();  //小时
    let minute  = diffTime.minutes(); //分
    let seconds  = diffTime.seconds(); //秒

    let m = [
        {key: 'year', value: year, suffix: '年',},
        {key: 'month', value: month, suffix: '月'},
        {key: 'day', value: day, suffix: '天',},
        {key: 'hour', value: hour, suffix: '小时',},
        {key: 'minute', value: minute, suffix: '分',},
        {key: 'seconds', value: seconds, suffix: '秒',},
    ]

    return m.reduce((str, item, index) => {
        if (Number(item.value) === 0) {
            return str;
        }
        return `${str}${item.value}${item.suffix}`;
    }, "");
}