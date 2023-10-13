<script setup>
import {useMixStore} from '~/store'
import {delay} from '~/shared'
import {emitRefreshHomePage} from '~/shared/emits'

defineOptions({
  name: "AppSetting"
})

const mixStore = useMixStore()
const onClickSetting = () => {
  mixStore.openAppSettingDrawer = true
}

const onClickRefresh = async () => {
  emitRefreshHomePage()
}

</script>

<template>
  <div class="app-setting">
    <el-button style="width: 32px;height: 32px;" @click="onClickRefresh">
      <el-icon size="24"><IEpRefresh /></el-icon>
    </el-button>
    <el-button style="width: 32px;height: 32px;" @click="onClickSetting">
      <el-icon size="24"><IEpSetting /></el-icon>
    </el-button>
  </div>
</template>

<style lang="scss" scoped>
.app-setting {

}
</style>
