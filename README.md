# 🎂 Birthday Quest Portal for Susan

## Overview

This is a special **Birthday Quest Portal** created for my daughter Susan's 30th birthday.

Susan is a lifelong reader, storyteller, and now a graduate student in Library Science at UW.  
For her 30th, I wanted to create something magical — something that reflected her love of quests, stories, and discovery.

Thus, this "Birthday Quest" was born:

- A physical **scavenger hunt** across campus and Seattle
- Hints leading to **three Words of Power**
- A **secret Portal web page**, where the words must be entered to unlock the final birthday message and gift.

---

## Technical Design

### Architecture

- **Static S3 Website** hosted on AWS
- Source code in GitHub, deployed via GitHub Actions
- No backend — fully offline / S3-safe
- **SHA-256 protected comparison of Words of Power** to avoid trivial source code cheating
- **Typewriter animation** for dramatic reveal of the final birthday message
- **TinyURL** used to provide simple link: https://tinyurl.com/2rk4jpmu

### Stack

- HTML / CSS / JavaScript
- [CryptoJS](https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js) for SHA-256 hashing
- AWS S3 static site hosting
- GitHub Actions used for deployment:
    - Upload `index.html` to S3 bucket: `susan-birthday-quest-uniqueid`

---

## Features

✅ Clean and elegant Portal interface  
✅ Words of Power must be entered in correct order  
✅ "✨ The Portal is Unlocked ✨" → intermediate reveal  
✅ Manual **Open the Portal** button adds suspense  
✅ Final message shown with **typewriter animation** — literary and thematic fit  
✅ Words of Power secured via **SHA-256 hash**  
✅ No plain text words exposed in JS  
✅ Fully works offline in static S3 site  
✅ Source friendly for personal future use

---

## Words of Power

The quest currently uses:

1. Inspiration
2. Stories
3. Happy

Hashes are precomputed using SHA-256 and stored securely in JS.  
Words are lowercased and trimmed at entry.

---

## Credits

This project was created in collaboration with **ChatGPT** as a creative assistant and architectural co-pilot.  
It is a personal gift from Dad to Susan — crafted with ❤️.

---

## Final Notes

- The project evolved from an initial idea → scavenger hunt → Portal → secure Portal with animation → fully deployed Quest experience.
- The entire project was built over one creative session and one evening.
- The result is a fully working magical experience that Susan will remember.

---

## June 2025 Updates — Final Birthday Quest Portal Behavior

- The Portal is now locked until **8:30pm AEST, June 12, 2025** — Susan's exact birth hour, in honor of her heritage.
- The lock uses UTC-based precision (`Date.UTC(2025, 5, 12, 10, 30, 0)`), ensuring perfect behavior across time zones.
- The teasing message explicitly displays **Australian Eastern Time** — reinforcing the theme of the Quest and her birth story.
- Once the Portal is unlocked and the gift message is revealed, a note will be displayed with a link to this README so Susan can see the technical artistry behind the experience.

**Creator's Note:**  
_This Quest was designed with great care to honor Susan’s life, passions, and heritage — and to create a moment of joy and magic on her 30th birthday._

---

With love,  
Dad
