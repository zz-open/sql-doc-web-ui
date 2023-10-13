<script setup>
import {useCssVar} from '~/composables'
import logoImg from '/vite.svg'
defineOptions({
  name: "AppLogo"
})

const {appLogoHeight, appLogoImgWidth, appLogoImgHeight} = useCssVar()
</script>

<template>
  <div class="app-logo">
    <img class="img" :src="logoImg">
    <div class="title">Mysqldoc</div>
  </div>
</template>

<style lang="scss" scoped>
.app-logo {
  height: v-bind(appLogoHeight);
  padding: 10px 24px 10px 42px;
  display: flex;
  align-items: center;
  transition: all .2s ease;
  cursor: pointer;

  .img {
    width: v-bind(appLogoImgWidth);
    height: v-bind(appLogoImgHeight);
  }

  .title {
    transition: all .5s;
    font-size: 16px;
    font-weight: 700;
    line-height: normal;
  }
}
</style>
