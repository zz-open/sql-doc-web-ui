import {shape} from '~/shared/deps'

export const descriptionMap = [
    {key: 'db_name', label: '数据库名称', default: '', type: String},
    {key: 'table_count', label: '表数量',  default: '0', type: String},
]

const defaultDataSource = descriptionMap.reduce((obj, item, index) => {
    obj[item.key] = item.default;
    return obj;
}, {});


const dataSourceShapeDef = descriptionMap.reduce((obj, item, index) => {
    obj[item.key] = item.type;
    return obj;
}, {});

export const dbDescriptionProps = () => ({
    dataSource: shape(dataSourceShapeDef).def(() => ({...defaultDataSource})).loose,
})