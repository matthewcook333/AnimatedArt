# Language design and implementation overview

## Language design

- How does a user write programs in your language (e.g., do they type in commands, use a visual/graphical tool, speak, etc.)?

The user writes programs through a visual/graphical interface on the iPad. The idea is for the interface to be intuitive, and for there to be no real new syntax for the user to learn. The main challenge with this will be making sure that it is actually intuitive to do what the user wants, more than just guessing and checking for how things are animated.

- What is the basic computation that your language performs (i.e., what is the computational model)?

The basic computation is for the user to define the attributes of a given image for animation, and for those to be implemented appropriately in the Swift model for animation, which can then be computed to visually see the animations being done.

- What are the basic data structures in your DSL, if any? How does a the user create and manipulate data?

The idea is to have the user draw the image, which will be the basis for the data structure. That image can then be manipulated by adding attributes for how that image should be animated, as well as nested animated images. This may also involve a chaining of animations, in which case the order in which the attributes are defined are relevant to the order the image is animated.

- What are the basic control structures in your DSL, if any? How does the user specify or manipulate control flow?

The basic control structures will simply be the order that the user defines the animations in. The point is for there to be no complex control structures, and for it to be intuitive in the sense that the user imagines the order it should be animated, and that is the order they define the animations.

- What kind(s) of input does a program in your DSL require? What kind(s) of output does a program produce?

The input shall be an image (which will be a drawn image, or possibly also allowing for imported images), the animation attributes for the image, which will be inputted through buttons, sliders, dropdown menus, etc. (touch based), and a list of previous animated images used for nesting the animations.

The output shall be the graphical output on the iPad for that given image and those animation attributes. The user will be able to immediately see the animated result of what they just defined.

- Error handling: How can programs go wrong, and how does your language communicate those errors to the user?

In terms of syntax errors, I am not anticipating any, as there shall be a well-defined set of actions that the user can do. Most likely it will just be that the animation will not do what the user envisioned, and that will be communicated through the fact that the animated image after they define it will look wonky. One consideration is how I want the user to make individual image, since if it is on the main canvas, then overlap of images can be troublesome for how to isolate the image. I may simply have a sandbox environment to create individual images, and then be able to "stamp" that on the canvas.

Another error the user could run into is by making too many animations. It is possible that the app could crash from throwing too many things on the screen. As I feel it would be artificial-limiting to impose an image limit, as hardware could always be improving. I think I would prefer for this error to be communicated to the user simply through the fact that the iPad will be lagging in all the animations as the iPad can't handle it, and then crashing out when the hardware simply cannot handle it anymore (and so that would involve no extra error handling on my part).

- What tool support (e.g., error-checking, development environments) does your project provide?

- Are there any other DSLs for this domain? If so, what are they, and how does your language compare to these other languages?

## Language implementation

Your choice of an internal vs. external implementation and how and why you made that choice.

Your choice of a host language and how and why you made that choice.

Any significant syntax design decisions you've made and the reasons for those decisions.

An overview of the architecture of your system.
