<script setup>
import {useMixStore} from '~/store'
defineOptions({
  name: "HeaderTitle"
})

const mixStore = useMixStore()
const dbName = computed(() => {
  return mixStore.dbName
})

const tableCount = computed(() => {
  return mixStore.tableCount
})
</script>

<template>
  <div class="header-title">
    <div class="blockquote">
      <span>数据库: </span>
      <span>{{dbName}}</span>
      <span style="color: #16b777">（{{tableCount}})</span>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.header-title {
  .blockquote {
    padding: 5px 0 5px 10px;
    font-size: 32px;
    //border-left: 5px solid #16b777;
    border-radius: 0 2px 2px 0;
  }
}
</style>

