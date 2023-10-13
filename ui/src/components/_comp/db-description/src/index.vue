<script setup>
import {dbDescriptionProps, descriptionMap} from './props'

defineOptions({
  name: "DbDescription"
})

const props = defineProps(dbDescriptionProps())
</script>

<template>
  <div class="db-description">
    <el-descriptions title="数据库信息" :column="1" border>
      <template v-for="(item, index) in descriptionMap" :key="index">
        <el-descriptions-item :label="item.label" label-align="right" align="center" width="150px">
          <span v-if="item.format">{{item.format(dataSource[item.key])}}</span>
          <span v-else>{{dataSource[item.key]}}</span>
        </el-descriptions-item>
      </template>
    </el-descriptions>
  </div>
</template>

<style lang="scss" scoped>
.db-description {

}
</style>

