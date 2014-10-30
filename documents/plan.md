# Project plan

## Language evaluation

To evaluate the language design, I would like to see that even without a UI, how easy is it for an inexperienced user to express the type of animation they would like for an image? Also, how easily my language representation be translated into a runnable instance of an animation? 

To evaluate whether the tool has accomplished its goals, I would like to go through user testing. Can a user, without prior instruction, simply be given the language and the UI as a tool to define the things in the language, be able to make something interesting. To define something "interesting", I would simply like the user be able to make an image that is animated in the way the user intended. I would also like to see that my example computations and similar drawings can be easily animated, which would mean that it can be done by an inexperienced user in a reasonable amount of time (depending on the example, I would hope for 1-3 minutes). 

## Implementation plan

For the host language, at the moment I am leaning towards Swift (possibly supplemented with Objective-C for things Swift cannot do) in order to implement this in iOS. Also, there is the SpriteKit and animation API for iOS development, which could likely make implementation smoother. Android would also be an option, but the SpriteKit API is likely a bigger advantage for this specific problem, and I personally prefer the coding and simulation environment for iOS, as well as the simpler testing environment without the need to accomodate a huge range of screen sizes.

In terms of schedule for work, here is the rough outline I currently have (denoted by due dates). Keep in mind that this is subject to change as I think of new ideas, that may be in addition to what I have, or time-wise may involve changing some design or implementation goal I had in mind:

Nov 2: Brainstorm project idea. Finish project description and plan. Familiarize myself with the basics of Swift and possibly begin the foundation of the UI for the project.

Nov 9: Have the first iteration of the full language design complete. Begin thinking about how this will affect implementation. Continue working on learning Swift and the foundation of the project (likely have the drawing environment done, and considering how I could add the animating framework).

Nov 16: Finalize the language design with help from feedback. Begin adding some of the basic animation attributes to the project, to an extent that I could do some testing and see whether this is a realizable goal/project.

Nov 23: Complete a prototype. Specfically, be able to show off a creating a basic animation. This will probably involve much more coding, in which I can hopefully have all of the types of animations completed, although maybe not nested animations.

Dec 1: Finish the preliminary evaluation. I would like to hopefully be able to have some nested animations at this point and show a working stick figure walking.

Dec 7: Finish off whatever needs to be done coding-wise, possibly making the overall UI cleaner and really presentable (hopefully! I suppose this is more of a stretch goal).

Dec 12: Have the final project ready! This would involve much more testing and tinkering. Also finish the final write-up.

Dec 18: Demo!

## Teamwork plan 

I plan on working alone on this, although with hopefully a lot of help from others in the class for input on design!
*If applicable*
