<script setup>
import {useCssVar} from '~/composables'
defineOptions({
  name: "ZzLayoutFooter"
})

const {layoutFooterHeight} = useCssVar()
</script>

<template>
  <el-footer :height="layoutFooterHeight"></el-footer>
</template>

<style lang="scss" scoped>

</style>


