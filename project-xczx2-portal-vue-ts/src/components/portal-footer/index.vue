<template>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <div>
            <!--<h1 style="display: inline-block">学成网</h1>-->
            <!--<img src="@/assets/img/logoIco.png" alt />-->
          </div>
        </div>
        <div class="col-md-5 row">
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component({
  name: "PortalFooter"
})
export default class extends Vue {}
</script>

<style lang="scss" scoped>
@import "index";
</style>