---
layout: two-cols
class: trainer-slide
---

<script setup>
import { computed } from 'vue'

// Read trainer name from environment variable or use default
// VITE_TRAINER_NAME is the primary variable (Vite convention)
// SLIDEV_TRAINER is provided as a fallback for convenience
const trainerName = import.meta.env.VITE_TRAINER_NAME || import.meta.env.SLIDEV_TRAINER || 'john-doe'

// Import all trainer JSON files using Vite's glob import
// This automatically loads all JSON files from the trainers directory
const trainerModules = import.meta.glob('./*.json', { eager: true })

// Load trainer data
const trainerData = computed(() => {
  try {
    // Build a map of trainer data from imported modules
    const trainers = {}
    Object.entries(trainerModules).forEach(([path, module]) => {
      // Extract filename without path and extension
      // e.g., './john-doe.json' -> 'john-doe'
      const filename = path.split('/').pop().replace(/\.json$/, '')
      // Skip the schema file
      if (filename !== 'trainer-schema') {
        trainers[filename] = module.default || module
      }
    })
    
    // Return the selected trainer or fall back to john-doe
    return trainers[trainerName] || trainers['john-doe'] || {
      name: 'Speaker Name',
      position: 'Position',
      bio: 'Please configure a trainer using VITE_TRAINER_NAME environment variable.',
      image: 'john-doe.svg'
    }
  } catch (e) {
    console.error('Error loading trainer data:', e)
    // Fallback trainer data
    return {
      name: 'John Doe',
      position: 'Senior Software Engineer',
      bio: 'Passionate about developer productivity and AI-assisted development.',
      github: 'johndoe',
      company: 'Xebia',
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
       rel="noopener noreferrer"
       aria-label="GitHub profile"
       class="text-blue-600 dark:text-blue-400 hover:underline">
      GitHub: @{{ trainerData.github }}
    </a>
    <a v-if="trainerData.linkedin" 
       :href="trainerData.linkedin" 
       target="_blank"
       rel="noopener noreferrer"
       aria-label="LinkedIn profile"
       class="text-blue-600 dark:text-blue-400 hover:underline">
      LinkedIn Profile
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
