---
layout: two-cols
class: trainer-slide
---

<script setup>
import { computed } from 'vue'
import { useSlideContext } from '@slidev/client'

// Read trainer name from environment variable or use default
const trainerName = import.meta.env.VITE_TRAINER_NAME || import.meta.env.SLIDEV_TRAINER || 'john-doe'

// Load trainer data
const trainerData = computed(() => {
  try {
    // Try to load the trainer JSON file dynamically
    // Note: In production, you would import this statically or load via fetch
    // For now, we'll use a fallback approach with known trainers
    const trainers = {
      'john-doe': {
        name: 'John Doe',
        position: 'Senior Software Engineer',
        bio: 'Passionate about developer productivity and AI-assisted development. 10+ years of experience in software engineering and DevOps.',
        email: 'john.doe@example.com',
        github: 'johndoe',
        company: 'Xebia',
        image: 'john-doe.svg'
      },
      'jane-smith': {
        name: 'Jane Smith',
        position: 'DevOps Trainer & Cloud Architect',
        bio: 'Helping teams adopt modern development practices and cloud-native technologies. Speaker and open-source contributor.',
        email: 'jane.smith@example.com',
        github: 'janesmith',
        linkedin: 'https://www.linkedin.com/in/janesmith',
        company: 'Xebia',
        image: 'jane-smith.svg'
      }
    }
    
    return trainers[trainerName] || trainers['john-doe']
  } catch (e) {
    console.error('Error loading trainer data:', e)
    return {
      name: 'Speaker Name',
      position: 'Position',
      bio: '',
      image: 'john-doe.svg'
    }
  }
})

const imagePath = computed(() => `/img/trainers/${trainerData.value.image}`)
</script>

<div class="flex flex-col items-center justify-center h-full pr-8">
  <img 
    :src="imagePath" 
    :alt="trainerData.name"
    class="w-64 h-64 rounded-full object-cover shadow-2xl border-4 border-white"
  />
</div>

::right::

<div class="flex flex-col justify-center h-full pl-8">
  <h1 class="text-4xl font-bold mb-4">{{ trainerData.name }}</h1>
  <h2 class="text-2xl text-gray-600 dark:text-gray-300 mb-6">{{ trainerData.position }}</h2>
  
  <div v-if="trainerData.company" class="mb-6">
    <p class="text-xl">
      <span class="text-gray-500 dark:text-gray-400">@</span> 
      <span class="font-semibold">{{ trainerData.company }}</span>
    </p>
  </div>
  
  <p v-if="trainerData.bio" class="text-lg text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
    {{ trainerData.bio }}
  </p>
  
  <div class="flex gap-4 text-sm">
    <a v-if="trainerData.github" 
       :href="`https://github.com/${trainerData.github}`" 
       target="_blank"
       class="text-blue-600 dark:text-blue-400 hover:underline">
      <carbon-logo-github class="inline mr-1" /> @{{ trainerData.github }}
    </a>
    <a v-if="trainerData.linkedin" 
       :href="trainerData.linkedin" 
       target="_blank"
       class="text-blue-600 dark:text-blue-400 hover:underline">
      <carbon-logo-linkedin class="inline mr-1" /> LinkedIn
    </a>
  </div>
</div>

<style scoped>
.trainer-slide {
  padding: 2rem;
}
</style>

<!--
This slide introduces the speaker/trainer.

To configure which trainer to display:
1. Set environment variable before running slidev:
   VITE_TRAINER_NAME=jane-smith npm run dev
   
2. Or set in .env file:
   VITE_TRAINER_NAME=jane-smith
   
3. Or pass as command line argument (requires setup script):
   npm run dev -- --trainer jane-smith

The trainer data is loaded from ./common/trainers/{name}.json
The trainer image is loaded from ./img/trainers/{name}.{jpg|png|svg}

[01:00-02:00] Time allocation for speaker introduction
-->
