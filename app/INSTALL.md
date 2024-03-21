# INSTALL
- [vue](https://unpkg.com/vue@3/dist/vue.global.js) [官网](https://vuejs.org/guide/quick-start.html#using-vue-from-cdn)
- [axios](https://unpkg.com/axios/dist/axios.min.js) [官网](https://www.axios-http.cn/docs/intro)
- [dayjs](https://unpkg.com/dayjs@1.8.21/dayjs.min.js) [官网](https://dayjs.fenxianglu.cn/category/#node-js)
- [chalk](https://www.jsdelivr.com/package/npm/chalk) [官网](https://www.npmjs.com/package/chalk?activeTab=readme)
- [element-plus](https://unpkg.com/browse/element-plus@2.3.14/dist/) [官网](https://element-plus.org/zh-CN/component/)
- [md-editor-v3](https://imzbf.github.io/md-editor-v3/en-US/index)
- [asciiart](https://www.asciiart.eu/text-to-ascii-art)
- [asciiart](https://blog.csdn.net/xuchaoxin1375/article/details/130308909)

## 初始化项目
```shell
pnpm create vite ui --template vue
```

## 第三方依赖
```shell
pnpm i dayjs && \
pnpm i axios && \
pnpm i element-plus && \
pnpm i @element-plus/icons-vue && \
pnpm i md-editor-v3 && \
pnpm i @vueuse/core && \
pnpm i chalk && \
pnpm i @vueuse/core && \
pnpm i vue-types && \
pnpm i pinia && \
pnpm i lodash && \
pnpm i mitt && \
pnpm i vue-dompurify-html && \
pnpm i vue-router && \
pnpm i -D unplugin-icons && \
pnpm i -D vite-plugin-top-level-await && \
pnpm i -D sass && \
pnpm i -D unplugin-vue-components unplugin-auto-import unplugin-element-plus && \
pnpm i -D rollup-plugin-visualizer && \
pnpm i -D vite-plugin-compression
```

## 前端任务列表
- [x] 代码高亮使用第三方组件
- [x] 前端增加log信息
- [x] 增加快速回到顶部组件
- [x] loading优化
- [x] 菜单样式
- [x] 完善固定布局
- [x] element-plus 的 menu 点击了以后没有选中的状态
- [x] 增加server信息抽屉组件
- [x] 解决了code组件加载cdn的问题
- [x] 无限滚动不适合作为锚点，因为界面dom还没加载出来
- [x] 完善打包命令，包括开发和生产环境，dist输出到后端目录
- [x] 优化打包体积，减小chunk
- [x] 完善各个环境的baseUrl