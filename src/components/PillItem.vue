<template>
  <a v-bind:href="url" target="_blank"
    ><span
      class="pill"
      v-bind:style="{
        backgroundColor: background,
        color: color,
        fontSize: size
      }"
    >
      <slot></slot> </span
  ></a>
</template>

<script>
export default {
  name: "PillItem",
  props: ["color", "background", "size", "url"]
};
</script>

<style lang="scss">
/* pill format */

.pill {
  padding: 0.1em 0.5em;
  font-weight: 600;
  font-size: 0.8em;
  border-radius: 10rem;
  margin: 1px;
  display: inline-block;

  cursor: pointer;
  &:hover {
    opacity: 0.7;
  }
}
</style>
