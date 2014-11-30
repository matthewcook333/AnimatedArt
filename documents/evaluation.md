# Preliminary evaluation

### What works well? What are you particularly pleased with? 

The simple animations I have so far work pretty well, and is pretty smooth as overall
what doesn't work is unimplemented and not bugs. I am particularly pleased with the
overall architecture so far, as I spent a fair bit of time on that. The way it is set up
is overall quite extensible and modular at least to the extent I envision the project at 
the moment.

### What could be improved? For example, how could the user's experience be better? How might your implementation be simpler or more cohesive?

Implementation-wise, although I spent a fair bit of time on the architecture and I like it for the most part,
there is still some modularity I could add, but would be more a tradeoff of time vs. architecture, which there
is not really much time for the project relatively. If I had time, I would like to debug XCode/iOS's issue
with the changing of the main view for a view controller to allow for a UIPickerView to change the animation view.
Beyond that, if I had even more time, I would want the menus to each be dropdown when you select it as I can
see that view becoming quite cluttered soon as I add more animations.

From the user's experience, there are three main aspects that need to be addressed. The first is the ability
to change the speed of animation. I plan on adding this first to allow the user to adjust the speed of the 
animations and immediately see the result. The second is disjoint paths, as that was unintuitive that the image
can teleport like that. The third is the actual use of the images, as I kept on spawning them in the same location,
and from the prototype it could not be seen how that happens or the fact that I plan to allow for drawing later.

### Re-visit your evaluation plan from the beginning of the project. Which tools have you used to evaluate the quality of your design? What have you learned from these evaluations? Have you made any significant changes as a result of these tools, the critiques, or user tests?

I have used the user-testing on the app itself. I feel that the prototype is good in terms of the overarching ease
of use, as Paul was able to use it and liked it without me even being there, as well as other user testing. I have 
decided how I will prioritize for implementation based on he user-testing, which was helpful.

For the user-testing, here are the notes I went off of to describe the language:

Domain: Animating drawn creations

Users: Casual creators/people who would like to create animatable drawings easily

I want the users to say something by drawing a picture as they normally would, and then be able to pick options for how they imagine this drawing would move.

What that would mean would be for the user to then clearly see exactly what that animation looks like physically, and can choose to tweak it to some extent to what they envision.

The user will explicitly define the drawing as well as the overarching animation type. There will be implicit properties to those animations that are not user-defined. The goal is for these implicit properties to be most intuitive for a drawing with simple animations.

As a result, I got these as the primary feedback that I plan to fix:

- animate path as drawing (once "touchesEnd" animate path)
- dont have teleportation, connect paths
- change draw path button to be done
- allow to clear path
- remove dashed line on "done"
- allow for changing speed
- allow for drawing the image (with diff colors/thicknesses)


### Where did you run into trouble and why? For example, did you come up with some syntax that you found difficult to implement, given your host language choice? Did you want to support multiple features, but you had trouble getting them to play well together?

I ran into a bunch of trouble with architecture stuff with Swift. Overall Swift was easy to learn and online help-wise it actually was not bad as I know Objective-C and could translate it to Swift pretty easily. For architecture and interface builder, many times I was unsure whether it was a bug with what I was doing, or an XCode
bug, as many suggestions online just kept saying to close and reopen XCode, or clean project, which sometimes worked... The syntax was overall very easy to implement, as I could just use the Core Animation library that does
many of the things I want, and has even more options than I need to describe each animation. I do wish I had a bit more by the time of the prototype, but had to spend a fair bit of time learning interaction between views, debugging weird error messages, many times due to "nil" views as Interface Builder was not working right. At this point, other than the ability to draw the images, I have something easily extensible without running into those same issues anymore, just more minor bug fixed and learning new animations.

### What's left to accomplish before the end of the project?

Here is sort of a priority list of what I would like to get done:

- Have sliders for each animation to describe speed
- Fix the path bugs from user testing (as described earlier) found.
- Allow for drawing pictures using simple tools.
- Clean up UI enough for presenting
- (Stretch) Add other types of animations/ Add ability for nesting
- (Stretch) Add ability for chaining

My goal is to get to the point where I can have a pretty clean UI for the animations I have so far and make the language easily usable. Adding the other types of animations is not a priority as I feel it can be more easily added, but for demo-ing I would do that only time-permitting. Prioritized similarly is to allow for nesting, as that is something that I think is important to the language, but implementation-wise could be trickier. Chaining is lesser on the priority list, as without more animations I feel it does not add as much to what there is with the language, though if I were to work on this further I would definitely want it as a feature.
