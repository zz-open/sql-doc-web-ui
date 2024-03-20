<script setup>
import {serverDescriptionProps, descriptionMap} from './props'

defineOptions({
  name: "ServerDescription"
})

defineProps(serverDescriptionProps())
</script>

<template>
  <div class="server-description">
    <el-descriptions title="服务器信息" :column="1" border>
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
.server-description {

}
</style>

