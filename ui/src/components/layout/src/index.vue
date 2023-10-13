<script setup>
import {useLayout} from './use-layout'
import {useMixStore} from '~/store'

import AppTeleport from "~/components/app-teleport"
import ZzLayoutLeft from "~/components/layout-left"
import ZzLayoutHeader from "~/components/layout-header"
import ZzLayoutMain from "~/components/layout-main"
import ZzLayoutFooter from "~/components/layout-footer"
import ZzLayoutEmpty from "~/components/layout-empty"

defineOptions({
  name: "ZzLayout"
})

const mixStore = useMixStore()
mixStore.setDbNameFromQuery()

const {state, showEmptyPage} = useLayout()
</script>

<template>
  <el-container class="zz-el-container-left" v-if="state.open">
    <zz-layout-left/>
    <el-container direction="vertical" class="zz-el-container-right">
      <zz-layout-header/>
      <zz-layout-main/>
      <zz-layout-footer/>
    </el-container>
    <app-teleport/>
  </el-container>
  <zz-layout-empty v-if="showEmptyPage()"/>
</template>

<style lang="scss" scoped>
.zz-el-container-left {
  width: 100%;
  height: 100%;
  position: relative;

  .zz-el-container-right {
    width: 100%;
    height: 100%;
    position: relative;
  }
}
</style>


