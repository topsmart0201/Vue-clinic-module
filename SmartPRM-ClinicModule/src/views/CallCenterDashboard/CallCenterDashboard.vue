<template>
    <div class="container">
        <h1>Call Center Dashboard</h1>
    </div>
</template>

<script>
import { xray } from '../../config/pluginInit'
export default {
  components: {
  },
  name: 'CallCenterDashboard',
  mounted() {
    xray.index()
  },
  data: function () {
    return {
    }
  },
  methods: {
  },
}
</script>
