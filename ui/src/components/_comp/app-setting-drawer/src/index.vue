<script setup>
import DbDescription from '~/components/_comp/db-description'
import ServerDescription from '~/components/_comp/server-description'
import {useMixStore, useApiStore} from '~/store'

defineOptions({
  name: "AppSettingDrawer"
})

const mixStore = useMixStore()
const apiStore = useApiStore()
const drawer = computed({
  get: () => mixStore.openAppSettingDrawer,
  set: (val) => {
      mixStore.openAppSettingDrawer = val
    }
})

const state = reactive({
  serverDataSource: undefined,
  dbDataSource: undefined,
})

onMounted(async () => {
  const dbInfo = await apiStore.getDbInfo(mixStore.dbName)

  state.serverDataSource = dbInfo
  state.dbDataSource = {
    table_count: dbInfo.table_count,
    db_name: dbInfo.db_name,
  }
})

</script>

<template>
  <el-drawer class="app-setting-drawer" v-model="drawer" direction="rtl" size="400" :with-header="false">
    <db-description :data-source="state.dbDataSource"/>
    <div style="height: 15px"></div>
    <server-description :data-source="state.serverDataSource"/>
  </el-drawer>
</template>

<style lang="scss" scoped>
.app-setting-drawer {

}
</style>
