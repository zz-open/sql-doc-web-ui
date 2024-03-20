<script setup>
import DbTableInfo from '~/components/_comp/db-table-info'

defineOptions({
  name: "ZzLayoutMain"
})

</script>

<template>
  <el-main class="zz-layout-main">
    <db-table-info/>
    <el-backtop target=".zz-layout-main" :visibility-height="700" :right="100" :bottom="100" />
  </el-main>
</template>

<style lang="scss" scoped>
.zz-layout-main {

}
</style>


