<template>
  <div class="d-flex align-items-center">
    <div class="avatar mr-3">
      <img :src="item.image" :alt="item.image" class="avatar-50 rounded" />
      <span class="avatar-status">
        <i
          class="ri-checkbox-blank-circle-fill"
          :class="`text-${item.status}`"
        />
      </span>
    </div>
    <div class="chat-sidebar-name">
      <h6 class="mb-0">{{ item.name }}</h6>
      <span>{{ item.role }}</span>
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  name: 'ChatItem',
  props: {
    item: { type: Object },
  },
})
</script>
