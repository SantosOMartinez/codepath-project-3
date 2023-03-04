# Project 2 - *Showman*

Submitted by: **Santos O. Martínez Braña**

**Showman** is a movie browsing app that lets you see information about relative films. 

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] Users are able to see a customized app icon and launch screen.
- [X] Your app should work for any screen size and orientation using AutoLayout constraints.
- [X] Displays at least 5 different movies in a table view.
- [X] Can tap into detail view of movie with a full description, backdrop image, and title.
 
The following **optional** features are implemented:

- [X] Unique UI changes, such as background, font/color changes, etc.
- [X] User implements a collection view.
- [X] User implements tab bar controller with at least two screens.

The following **additional** features are implemented:

- [X] Animations for table and collection cells where they fade in.
- [X] Light and Dark mode support.
- [X] Additional movie information such as movie ranking based on popularity.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

<!-- Replace this with whatever GIF tool you used! -->
<!-- Note: Used MP4 video format instead of GIF as the file size was way smaller at a higher quality.-->
Video created with:
- Recorded in QuickTime Player
- Edited in Final Cut Pro
- Compressor for file format conversion
<!-- Recommended tools:
[Kap](https://getkap.co/) for macOS
[ScreenToGif](https://www.screentogif.com/) for Windows
[peek](https://github.com/phw/peek) for Linux. -->

## Notes

Describe any challenges encountered while building the app.

I ran into a bug that can easily be solved if I learn where some specific events can be called and handled. These is a very minor bug that is on the stretch feature but is caused by my current lack of knowledge with UIKit. I think that if I gain more knowledge in UIKIt this bug can be resolved.

**Bug:**

Movie ranking style is sometimes not updated correctly when the cell is removed and then added back in. 

(Visible when large lists and scroll out of region and returns to it).

 This bug is there because I am unable to reliably access the cell's index relative to the list data provided. `indexPath.row` reflects the index of the virtualized list and can sometimes not reflect the exact index of the cell based on the list data it originates from.

## License

    Copyright [2023] Santos O. Martínez Braña

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.