# Mars Arena Addon (Public Engine Code)

**Mars Arena Addon (Public)** is the core engine code for the **Mars Arena** Warcraft III custom map. This repository contains source code that can be reused or inspected by the community. It is kept up-to-date with each Mars Arena map release, ensuring that the community has access to the latest engine code used in the map. It’s written in **Zinc**. The code here is intended for developers and modders to inspect, use, or contribute to the engine of Mars Arena.

However, because the repository omits the proprietary game content such as hero abilities, item logic, or object data. It cannot be used to build the full Mars Arena map on its own – it’s meant as an engine reference and development resource rather than a standalone game content.

This repo includes **the foundational systems and engine logic**.
All components are written in a modular and reusable way. They form the infrastructure of the map, ensuring that shared functionality (like applying buffs, calculating regeneration, or spawning projectiles) behaves consistently across all code that uses it.

## Installation

To use this engine in your own Warcraft III map, follow these steps:

1. **Clone or Download the Repository**
   Get the contents of this repository onto your computer.

2. **Rename the Folder**
   Rename the root folder of the repository to **`mars-addon-code`**.
   *(This is required for the relative `//! import` paths to work.)*

3. **Place Your Map File**
   Put your map file in the same parent directory as the `mars-addon-code` folder.

   ```bash
   /your-project-folder/
   ├── mars-addon-code/
   └── your-map.w3x
   ```

5. **Add Import Directive**
   In your map’s script header, add the following import line:

   ```bash
   //! import "../mars-addon-code/main_dev_kane.vj"
   ```

6. **Compile and Test**  
    Open the map in the World Editor, compile it, and launch it in Warcraft III.  
    The engine initializes silently. You won’t see gameplay elements unless you’ve added some but if the map runs without errors, the integration is successful.
