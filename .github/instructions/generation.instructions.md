## Process Instructions

* Create a todo list as markdown checklist file for the main steps you take and for each main section of the presentation and process that one and update the todo list until done. This will make the contents you need to deal with smaller and easier to handle.

* Create a subfolder for the presentation in the `presentations` folder. Use the presentation title as name for the folder.

## Running & building

* Install once with `npm install`, then preview any deck via `npx slidev <deck>.md` (VS Code exposes ready-made tasks for the popular decks). Use `npx slidev slides.md` to test the index site locally.
* `npm run build` (invokes `build.sh`) requires a bash-compatible shell; it wipes `dist/`, builds the index site and all decks, and places the results in `dist/`.
* Formatting relies on `prettier` plus `prettier-plugin-slidev` (`npm run format`).