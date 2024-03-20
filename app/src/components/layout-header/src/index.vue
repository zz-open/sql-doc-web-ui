<script setup>
import {useCssVar} from '~/composables'
import HeaderTitle from '~/components/_comp/header-title'
import AppSetting from '~/components/app-setting'

defineOptions({
  name: "ZzLayoutHeader"
})

const {layoutHeaderHeight,layoutHeaderBgColor} = useCssVar()

</script>

<template>
  <el-header :height="layoutHeaderHeight" class="zz-layout-header">
    <el-row>
      <el-col :span="19"> <header-title /></el-col>
      <el-col :span="5" style="display: flex;justify-content: flex-end;">
        <app-setting />
        <div style="width: 15px"></div>
      </el-col>

    </el-row>
  </el-header>
</template>

<style lang="scss" scoped>
.zz-layout-header {
  background-color: v-bind(layoutHeaderBgColor);
}
</style>


