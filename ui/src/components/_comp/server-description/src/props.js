import {shape} from '~/shared/deps'
import {countdownFormat,textDefault} from '~/shared'

export const descriptionMap = [
    {key: 'version', label: '版本', default: '', type: String},
    {key: 'host', label: '主机', default: '', type: String},
    {key: 'port', label: '端口', default: '', type: String},
    {key: 'username', label: '账号', default: '', type: String},
    {key: 'password', label: '密码', default: '******', type: String, format: () => {return `******`}},
    {key: 'default_character_set_name', label: '字符集', default: '', type: String},
    {key: 'default_collation_name', label: '字符校验集', default: '', type: String},
    {key: 'uptime', label: '运行时间', format: (val) => {return countdownFormat(val)}, default: '', type: String},
    {key: 'max_connections', label: '连接数上限', default: '', type: String},
    {key: 'threads_connected', label: '当前连接数', default: '', type: String},
    {key: 'threads_running', label: '活跃连接数', default: '', type: String},
    {key: 'innodb_buffer_pool_pages_total', label: '总页数', default: '', type: String},
    {key: 'innodb_buffer_pool_pages_dirty', label: '脏页', default: '', type: String},
    {key: 'innodb_buffer_pool_pages_dirty_rate', label: '脏页比例',
        format: (val) => {
            return !val ? '' : `${val}%`
        },
        default: '', type: String
    },
    {key: 'innodb_buffer_pool_pages_free', label: '空闲页', default: '', type: String},
    {key: 'innodb_buffer_pool_pages_free_rate', label: '空闲页比例',
        format: (val) => {
            return !val ? '' : `${val}%`
        },
        default: '', type: String
    },
]

const defaultDataSource = descriptionMap.reduce((obj, item, index) => {
    obj[item.key] = item.default;
    return obj;
}, {});

const dataSourceShapeDef = descriptionMap.reduce((obj, item, index) => {
    obj[item.key] = item.type;
    return obj;
}, {});

export const serverDescriptionProps = () => ({
    dataSource: shape(dataSourceShapeDef).def(() => ({...defaultDataSource})).loose,
})