<script setup>
import DbTableMenu from '~/components/_comp/db-table-menu'
import AppLogo from '~/components/app-logo'
import ZzLayoutLeftFooter from '~/components/layout-left-footer'
import {useCssVar} from '~/composables'

defineOptions({
  name: "ZzLayoutLeft"
})

const {layoutLeftWidth} = useCssVar()
</script>

<template>
  <el-aside class="zz-layout-left">
    <app-logo />
    <db-table-menu />
    <zz-layout-left-footer />
  </el-aside>
</template>

<style lang="scss" scoped>
.zz-layout-left {
  width: v-bind(layoutLeftWidth);
  height: 100%;
  display: flex;
  flex-direction: column;
  top: 0;
  bottom: 0;
  left: 0;
}
</style>


