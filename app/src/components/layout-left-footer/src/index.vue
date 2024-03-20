<script setup>
import {useCssVar} from '~/composables'

defineOptions({
  name: "ZzLayoutLeftFooter"
})

const {layoutLeftFooterHeight} = useCssVar()
</script>

<template>
  <div class="zz-layout-left-footer"></div>
</template>

<style lang="scss" scoped>
.zz-layout-left-footer {
  height: v-bind(layoutLeftFooterHeight);
}
</style>


