<script setup>
import AppSettingDrawer from '~/components/_comp/app-setting-drawer'
defineOptions({
  name: "AppTeleport"
})

</script>

<template>
  <Teleport to="body">
    <app-setting-drawer />
  </Teleport>
</template>

<style lang="scss" scoped>
</style>
