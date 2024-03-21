import {defineConfig} from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import {ElementPlusResolver} from 'unplugin-vue-components/resolvers'
import ElementPlus from 'unplugin-element-plus/vite'
import Icons from 'unplugin-icons/vite'
import IconsResolver from 'unplugin-icons/resolver'
import topLevelAwait from "vite-plugin-top-level-await";
import { visualizer } from 'rollup-plugin-visualizer';
import path from 'node:path'

const pathSrc = path.resolve(__dirname, 'src')

export default defineConfig({
    base: "/ui",
    server: {
        host: '0.0.0.0',
    },
    build: {
        chunkSizeWarningLimit: 1024,
        rollupOptions: {
            output: {
                chunkFileNames: 'js/[name]-[hash].js', // 引入文件名的名称
                entryFileNames: 'js/[name]-[hash].js', // 包的入口文件名称
                assetFileNames: '[ext]/[name]-[hash].[ext]', // 资源文件像 字体，图片等
            }
        }
    },
    resolve: {
        alias: {
            '~/': `${pathSrc}/`,
        },
    },
    css: {
        preprocessorOptions: {
            less: {
                javascriptEnabled: true
            },
            scss: {
                additionalData: `@use "~/styles/index.scss" as *;`,
            },
        },
    },
    plugins: [
        vue(),
        ElementPlus({
            importStyle: 'sass',
            useSource: true
        }),
        AutoImport({
            imports: ['vue'],
            resolvers: [
                ElementPlusResolver(),
                IconsResolver({
                    prefix: 'Icon',
                }),
            ],
        }),
        Components({
            extensions: ['vue'],
            directoryAsNamespace: true,
            include: [/\.vue$/, /\.vue\?vue/],
            resolvers: [
                ElementPlusResolver({
                    importStyle: 'sass',
                }),
                IconsResolver({
                    // ep 是 Element Plus 的缩写
                    enabledCollections: ['ep'],
                })
            ],
        }),
        Icons({
            autoInstall: true,
        }),
        topLevelAwait({
            // The export name of top-level await promise for each chunk module
            promiseExportName: "__tla",
            // The function to generate import names of top-level await promise in each chunk module
            promiseImportName: i => `__tla_${i}`
        }),
        visualizer(),
        // viteCompression({
        //     verbose: true, // 默认即可
        //     disable: false, //开启压缩(不禁用)，默认即可
        //     deleteOriginFile: false, //删除源文件
        //     threshold: 10240, // 如果体积大于阈值，将被压缩，单位为b，体积过小时请不要压缩，以免适得其反
        //     algorithm: 'gzip', // 压缩算法，可选['gzip'，' brotliccompress '，'deflate '，'deflateRaw']
        //     ext: '.gz', //文件类型
        // })
    ],
})
