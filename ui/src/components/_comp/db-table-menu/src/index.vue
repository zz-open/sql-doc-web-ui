<script setup>
import {useMixStore} from '~/store'
import {useCssVar} from '~/composables'
defineOptions({
  name: "DbTableMenu"
})

const mixStore = useMixStore()
const data = computed(() => {
  return mixStore.tableList
})

const {dbTableMenuWidth, dbTableMenuHeight} = useCssVar()

const defaultActiveName = ref("")
const onClickMenuItem = (index) => {
  defaultActiveName.value = index
  document.querySelector(`#${defaultActiveName.value}`).scrollIntoView({
    behavior: "smooth",
    // 定义动画过渡效果， "auto"或 "smooth" 之一。默认为 "auto"
    block: "start",
    // 定义垂直方向的对齐， "start", "center", "end", 或 "nearest"之一。默认为 "start"
    inline: "start"
    // 定义水平方向的对齐， "start", "center", "end", 或 "nearest"之一。默认为 "nearest"
  })
}

</script>

<template>
  <el-scrollbar :height="dbTableMenuHeight">
    <el-col class="db-table-col">
      <el-menu class="db-table-menu" background-color="white">
        <template v-for="(item,index) in data" :key="item.name">
          <el-menu-item :index="item.name" :class="['menu-item', defaultActiveName === item.name? 'menu-item__active': '']" @click="onClickMenuItem(item.name)">
            <span style="color: #0088cc">{{ item.name }}</span>
          </el-menu-item>
        </template>
      </el-menu>
    </el-col>
  </el-scrollbar>
</template>

<style lang="scss" scoped>
.db-table-menu {
  width: v-bind(dbTableMenuWidth);
  --el-menu-border-color:white;
  .menu-item {
    height: 35px;
    &__active {
      background-color: #34ccb4 !important;
      span {
        color: #fff !important;
      }
    }
  }
}

.db-table-col {
  height: v-bind(dbTableMenuHeight);
}
</style>

