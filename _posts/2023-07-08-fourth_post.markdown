---
layout: post
title: "Long Post Alert!!"
date:   2023-07-08 02:00:36 +0530
categories: gsoc
tags: kde gsoc
---

<!-- ![Bundle Creator](/assets/windmill.png) -->
![Bundle Creator](/assets/MidTerm.gif)


# Caution: Technical Jargon Zone!

If you had been following my earlier blog posts, you would know that I rarely include any code in them. My focus has primarily been on explaining how things work rather than delving into the specifics of how I implemented them. But this time I will be taking a deeper dive into the code, so in case you want to skip code today, you better not start reading this. ;)

This blog post has been a bit of a learning exercise for me as I pushed myself to learn UML diagrams and study a few design patterns in Qt. Learning Qt itself has been a challenge, though I doubt I can barely say that I have learnt it - I think it's safe to say that I have just got more comfortable not understanding most things in Qt and trying to understand the parts that concern me. Now that I'm a teeny tiny bit wiser, I feel learning Object-Oriented Programming with C++, and a few design patterns prior to learning Qt would have been a better idea. Things (read classes) make a lot more sense once you understand the core design patterns.

## Bundle Creator Wizard 

The plan was to split the bundle creator into four main components, each having a single responsibility (<b>Single Responsibility Principle</b>!). `DlgCreateBundle` is the main class for the Bundle Creator. Notice how it has all functions related to putting the resources, tags and metadata in the bundle. 

Similarly, all the code regarding resource choosing is present in `PageResourceChooser`(well not all, some of it in `WdgResourcePreview`), `PageTagChooser`(and `WdgTagPreview`) deals with the bundle's tags, and all the metadata logic is present in `PageMetaDataInfo`. These wizard pages are completely independent of each other. There is, however, a message passing between `PageBundleSaver` and the other wizard pages which I will discuss later.

![](https://i.postimg.cc/zv4H3hSq/Bundle-Creator-drawio-4.png)


## Resource Item Viewer

The Bundle Creator's Resource Item Viewer now shares the same user interface as the one used by the Resource Manager in Krita. However, in order to not upset existing users of Krita, a new View Mode Button has been added so that users can switch between grid view and list view as per their preference.

The `WdgResourcePreview` class only deals with the left half of the Bundle Creator and the Resource Manager. That said, it loads the resources from the Resource Database onto the viewer, and displays resources as filtered by text or tag. However, all the code related to what happens when a resource item is clicked is dealt within the `PageResourceChooser` class for the Bundle Creator and the `DlgResourceManager` for the Resource Manager. 

To manipulate the working of the right half of the Resource Chooser Page, one would need to make modifications to `PageResourceChooser`. And even though the left and right halves of the Resource Chooser page look fairly identical, it is important to note that the left half is built upon a `QListView` (`KisResourceItemListView`) and the right one on a `QListWidget` (`KisResourceItemListWidget`). This is because the left half loads the data directly from the Resource Database, using `KisResourceModel`. And the right half provides a view of the resource items selected by the user. It does use `KisResourceModel` for fetching the icon and name of the relevant item, but it doesn't use the model directly.

![](https://i.postimg.cc/K8n8rnwV/Resource-Page-drawio.png)

This is really how each class mentioned above looks like. 

![](https://i.postimg.cc/qqLLWmmF/Common-UI.jpg)

## Qt's Model View Architecture in Bundle Creator

Similarly to MVC, Qt's Model/view design pattern is essentially separated into three components: <b>Model</b>, <b>View</b> and <b>Delegate</b>.

Instead of utilizing controller classes, Qt's view handles data updating through delegates. It serves two primary objectives: firstly, aiding the view in rendering each value, and secondly, facilitating user-initiated changes. As a result, the controller's responsibilities have merged with the view, as the view now assumes some of the tasks traditionally assigned to the controller through Qt's delegate mechanism.

![](https://i.postimg.cc/t46NQNVd/mvc-drawio.png)

The `KisResourceModel`, `KisTagModel`, `KisStorageModel` act as the models for the `QComboBox`-es in the Bundle Creator(and Resource Manager). The `KisTagFilterResourceProxyModel` is built on top of the `KisResourceModel` and `KisTagModel`, and serves as a model for the `KisResourceItemView` which displays the list of available resources. And the `KisResourceItemDelegate` renders the items of data. When an item is edited, the delegate communicates with the model directly using model indexes.

| Model | View |
|-------|------|
| KisResourceModel|QComboBox|
| KisTagModel|QComboBox|
| KisStorageModel|QComboBox|
| KisTagFilterResourceProxyModel|KisResourceItemView|



![](https://i.postimg.cc/GpbmQbP0/test1-drawio-1.png)

## Signal Slot Mechanism in Bundle Creator

Very classic, but just a rough sketch showing how the wizard pages communicate with one another. This connection helps to update the summary in `PageBundleSaver` whenever the selected list of resources or tags changes.

![](https://i.postimg.cc/zvt4ywcy/Signal-Slot-drawio.png)


## A bit about the Tag Chooser

![](https://i.postimg.cc/44Ynbpt5/finaltags.png)

This is something I have been working on last week. The Tag Chooser page is updated to look similar to the Resource Manager's tag section. The available tags are displayed using `KisTagLabel` and the selected ones are displayed(and selected) using `KisTagSelectionWidget`. In both the cases, the `KisTagModel` serves as the underlying model.


### Merge Request 

My merge request can be viewed [here](https://invent.kde.org/graphics/krita/-/merge_requests/1802).


### Important Commits

- [Improve Bundle Creator in Krita](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=2321de6a24a6013b090faf0e7f46fd442c8a2901)
- [Implement Resource Chooser page](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=04d40bc22fd5ecc897ba87108ed135370c3e7298)
- [Add common UI to Resource Manager](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=94c54d1806e035c076cfb6b92c3b9de3a9d69037)
- [Implement metadata and saver pages](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=e0cd7e47e3c7a75f2b95cee694e387da1ce9c707)
- [Add toolbutton to switch views](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=3cb54b26df4a290fc8961f7415139cb2274839b4)
- [Add ToolButton for Selected Table](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=b950caf321f7ea50fae9576f553ee686aa438f6c)
- [Apply background to icons](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=0553ff71046e8136241d03a17eb4dfcd637e9472)
- [Make icons smaller](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=f672e61b865ed96b6dfa804449dc7829630d78ec)
- [Add Summary](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=443121afd18b366c96454b3f2098e8e5bf7fd2ec)
- [Add tags to summary](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=7bdf10e36639aa5ceec4103487f214fb1d213134)
- [Highlight side widget](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=0d3a34baf12df9a129de3823cf456e7959e4aed5)
- [Add enum for clarity](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=90c8e2f6b8bc08a41c392a6c10f2fdd400779e39)
- [Add enum in resource item viewer](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=bacde075314042be235284c28270d4b9f5cacde5)
- [Improve Tag Chooser](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=6b257ec14c6cfec87cf0df1f947a09463c557047)
<!-- - [Resolve merge conflicts, add edit bundle button](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=24813e070a4e965521e3e6fb91ac5440b3c77cc4), [Resolve conflicts](https://invent.kde.org/graphics/krita/-/merge_requests/1802/diffs?commit_id=dc4612ae8909629bc8b2f045eafa87b56e1acf24) -->


## Plans post Mid-Term Evaluation

Post midterm, I would be working on adding the feature of editing bundles in Krita, which will allow artists to add and delete components from existing bundles, so that they won't have to go through the process of creating a bundle from scratch whenever they want to make some changes. I've created a [post](https://krita-artists.org/t/bundle-editor-new-feature/69635) on Krita Artists Forum to better understand the preferences of artists regarding bundle editing. Feel free to drop a comment if you want to talk about it! :D 

-----------
This time a hand drawn art since I have exhausted my collection of art made using Krita - serves as a  reminder that I should do this more often. :) 

![Hand Drawn](/assets/handDrawn.jpeg)
