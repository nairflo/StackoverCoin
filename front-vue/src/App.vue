<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
#app {
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
  text-decoration: none;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  justify-content: center;
  display:flex;
  color: #2c3e50;
  width: 100%;
}
*{
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
    text-decoration: none;
    margin: 0;
}
html, body{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 100%;
    margin: 0;
    background-color: #efefef;
}
</style>
