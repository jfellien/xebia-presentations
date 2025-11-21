## Slides

Create Slidev presentations following these guidelines:

* The presentation should be structured similar to the template (`*.md`) already present in the root of this repository excluding the `slides_template.md`.
* Put all assets like images and diagrams in the `public/` folder and reference them from there.
* Create the presentation as a new markdown file in the root of the repository.
* Put all additional slides in a subfolder named '/artifacts/'.
* follow these rules when creating the new slidev presentation:
* use the same theme, transitions and addons as well asthe other fromtmatter options
* use a proper route alias based on the presentation topic
* set the presentation title, author, date and other relevant metadata in the frontmatter

### Format and Structure
* ensure the deck contains the following elements:
  * cover slide
  * speaker introduction slide (`/artifacts/speaker.md`)
  * a teaser slide triggering the audience's curiosity about the main topic
  * agenda slide (`/artifacts/agenda.md`)
  * content slides covering the main topic in detail
  * summary or closing slide
  * Q&A slide
  * thank you slide (`/artifacts/thank-you.md`)
* Structure the content slides into logical sections or chapters, each introduced by a chapter slide if necessary
* Ensure each slide has a concise title that reflects its content.
* Use bullet points, images, and diagrams where appropriate to enhance understanding.
  * Bullets should sit inside `<v-clicks> ... </v-clicks>` to align with the talk pacing expectations stated in the existing decks.
* use differnt layout for the slides
  * preferably use the same layouts as in the other slide decks in the repository
  * vary the slide layouts
  * for section slides use dark layouts with images
  * preferably use image-heavy layouts for slides
  * at least 50% of the slides should use image-heavy layouts
  * no image layout on slides with tables, code snippets or mermaid diagrams
  * create mermaid diagrams where appropriate to illustrate complex concepts, workflows,structures, data, relationships, or processes etc.
  * for timelines use vue-timeline component from `@xebia/slidev-addon-components-common`
* Split slides with `---` and keep a blank line after each separator. When frontmatter is needed, use the `--- <yaml> ---` form before the content block.
* when extracting take care that `---` always starts a new slide or or closes frontmatter. So don't make the original slide invalid.

### Visuals
* use visuals to support the content and make it more engaging
  * add relevant images, diagrams, icons, or illustrations to enhance understanding
* add suggestions for visuals in the speaker notes if you are unsure about the best visual representation for a slide

### Demos
* add slides for **demos** where appropriate to illustrate key points or visualize concepts or tools
  * add instructions for the demo in the speaker notes
  * have at least 3 demo slides in the presentation

### Speaker Notes
* Include **speaker notes** for each slide to guide the presentation delivery.
  * add a prompt to the speaker notes for creating an AI-generated image relevant to the slide content (generated images should be in the same style like e.g. `/public/devcontainer_move.jpeg` or `/public/devcontainer.jpeg`)
  * set the speaker notes below of the slide content using the `<!-- [...] -->` comment
  * include time estimates for each slide or section in the speaker notes in the format `[mm:ss–mm:ss]`

### Agenda
* the agenda / toc should only contain slides starting new topics
* hide slides by settings their level > 1 or setting `hideInToc: true` in the frontmatter
* do not have more than 10 main topics in the agenda / toc
* if two subsequent slides have very little content, merge them into one slide

### Content Creation
* for code snippets, use syntax highlighting and ensure proper formatting
  * if a slide has a small source code snippet, put it directly into the slide
* if a slide has a large source, move to into a subfolder named after the presentation topic and reference it from there
* put your reasearched content into separate markdown files in a subfolder for easier re-use

## Components & styling

* Global wrappers: `global-top.vue` shows the progress bar (via `slidev-component-progress`); `global-bottom.vue` renders the glow effect controlled by frontmatter keys `glowEnabled`, `glow`, `glowOpacity`, `glowHue`, and `glowSeed`. Disable animations per deck with `glowEnabled: false` or tune the distribution values (e.g., `glow: top-right`).
* Custom Vue components in `components/`: `Aside.vue` provides consistent callouts (`<Aside type="warning" title="Heads up">...</Aside>`), while `PartialWebContent.vue` can live-fetch static HTML snippets (`url`, optional `regex`, and `scale/width/height` props).
* Follow the theme’s layout presets (see https://sli.dev/builtin/layouts). The default frontmatter already locks the Xebia theme, fade transition, and addon list—deviate only with a clear reason.

## References

* Slidev syntax & frontmatter: https://sli.dev/guide/syntax and https://sli.dev/custom/#frontmatter (type definitions live in `packages/types/src/config.ts` upstream).