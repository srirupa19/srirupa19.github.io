---
layout: post
title: "Unleashing the new Bundle Editor"
date:   2023-08-18 02:00:36 +0530
categories: gsoc
tags: kde gsoc
--- 

# Introducing the Bundle Editor

The Bundle Editor is an extension of the Bundle Creator, designed to enable artists to modify existing bundles. Often, when downloading a bundle, we find ourselves drawn to specific brushes and realize that a portion—ranging from 10% to 50%—will likely go unused. In such instances, the ability to trim down bundle sizes by removing unnecessary brushes offers the potential to significantly save on disk space.

Moreover, this functionality extends beyond bundles located solely within the resource folder `usr/local/krita`. It grants users the freedom to edit bundles from any preferred location. What's even more impressive is that these edited bundles won't be permanently added to the database, thus conserving space. They are temporarily integrated into the database solely for the editing process. Upon restarting Krita, the edited bundles are automatically removed from the database. In order to use the edited bundle, users need to import it just like they would do in case of a normal bundle.

## How to edit bundles

To edit bundles, follow these steps:

- Navigate to `Settings > Manage Resource Libraries... > Edit Bundle`.
- Choose the desired bundle from your preferred location. The Bundle Creator will open in Editing Mode, displaying the resource items of the selected bundle in the Bundle Editor.
- Customize your bundle by adding or removing resource items based on your preferences.
- Proceed to the next section to manage tags. You can effortlessly add or remove tags to organize your bundle content.
- Modify bundle metadata according to your preferences. Note that altering the bundle name won't overwrite the original bundle; instead, a new copy with the new name will be created. If you intend to overwrite the existing bundle, avoid changing its name.
- By default, the Bundle Editor saves the edited bundle in its original location, effectively overwriting it (unless you alter the name). Alternatively, if you opt to save the edited bundle in a new location, the original bundle remains unaffected, and the edited version is stored separately.
- Be mindful that the Bundle Editor issues a warning if you choose to overwrite the original bundle, as this action could result in data loss. This safeguard prevents accidental overwriting of downloaded bundles.

The bundle editing workflow has been demonstrated below.

![Bundle Creator](/assets/bundle_editor.gif)

-------------------

Again, a drawing on paper because I was too busy to draw something in Krita. :(

![Bundle Creator](/assets/eye.jpeg)
