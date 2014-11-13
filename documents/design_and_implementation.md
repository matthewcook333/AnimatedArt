# Language design and implementation overview

## Language design

### How does a user write programs in your language (e.g., do they type in commands, use a visual/graphical tool, speak, etc.)?

The user writes programs through a visual/graphical interface on the iPad. The idea is for the interface to be intuitive, and for there to be no real new syntax for the user to learn. The main challenge with this will be making sure that it is actually intuitive to do what the user wants, more than just guessing and checking for how things are animated.

1.) Draw picture on canvas area of screen. This will simply be arbitrary strokes on the screen (which will just be stored as the coordinates/path that were touched)

2.) Pick Animation Type (e.g. rotation, moving, oscillation, etc.) on the side menu.

3.) From dropdown menu of picking animation type, the user selects details/attributes of the animation (e.g. direction of rotation, degrees of oscillation, etc.). This may also be done on the canvas in the case of picking pivot point or drawing path. The user also selects the speed/rate of the animation.

4.) From the side menu, the user picks a "Command", which is some option for the completion of this current animation attribute. There are four possibilities for this.
  a.) "Done!" - After clicking this, the animated image is saved, and cannot be changed. This image will remain on the screen, animated. The user can now draw another image to be animated, which will have entirely different attributes.
  b.) "Chain!" - Continue animating the current image, but refresh the animation menu to chain another animation after this one (e.g. rotate once, then move, repeat).
  c.) "While!" - Similar process as "Chain!", but this new animation occurs simulatenously as the previous one (e.g. move while rotating).
  d.) "Nest!" - The user can now draw another image, and this new image will already start with the attributes of the current animation (e.g. draw a stick body that moves, choose "Nest!" and draw oscillating legs that will then be moving with the body).

### What is the basic computation that your language performs (i.e., what is the computational model)?

The basic computation is for the user to define the attributes of a given image for animation, and for those to be implemented appropriately in the Swift model for animation by creating SpriteNodes and adding the animation attributes to that SpriteNode, which can then be computed to visually see the animations being done.

### What are the basic data structures in your DSL, if any? How does a the user create and manipulate data?

The idea is to have the user draw the image, which will be the basis for the data structure. That image can then be manipulated by adding attributes for how that image should be animated, as well as nested animated images. This may also involve a chaining of animations, in which case the order in which the attributes are defined are relevant to the order the image is animated.

Thus, there will be the highest level data structure, which is an "Animatable" image. It will have the property of a list of "Animations". An "Animation"  will be an abstract type with the speed/rate of the animations. Each type of animation will implement the "Animation" type. One will be "Rotate", which is have clockwise/counterclockwise. Another will be "Translate", which will have a list that is the path of points (or direction vectors) to traverse. Another type will be oscillation, which will consist of the point of oscillation, as well as angle to oscillate. Another animation type will be opacity/transparency, which will probably just have the range of transparency to cycle between (e.g. fade in and out between 20% to 100% transparency at the rate specified by the "Animation"). Another type will be Scale/Expand, which will allow the image to expand and shrink, at a size that is in the range of a multiple of the original.

To reiterate, this is

*Animatable* (image with attributes)
- List of animations

*Animation* (abstract class which all the classes below implement)
- Speed/Rate

*Rotate*
- Clockwise/Counterclockwise

*Move*
- Path

*Oscillate*
- Pivot Point
- Degrees of oscillation

*Transparency*
- Range - max min (% between 0 and 100)

*Scale/Expand*
- Range - max min (between x0 and x5 or something)

### What are the basic control structures in your DSL, if any? How does the user specify or manipulate control flow?

The control structures are the four "Commands" the user can do as specified above. By selecting "Done!" the user can start making the next object/animatable. By selecting "Chain!", the user specifies the next animation for this current image, sequentially. By selecting "While!", the user specifies another animation that is simulataneous, which cannot be the same image as the current one (it would not make much sense for a single image to move in two directions). By selecting "Nest", the user can say that the next image shall already have the same attributes, but add more to it.

### What kind(s) of input does a program in your DSL require? What kind(s) of output does a program produce?

The input shall be an image (which will be a drawn image, or possibly also allowing for imported images), the animation attributes for the image, which will be inputted through buttons, sliders, dropdown menus, etc. (touch based), and a list of previous animated images used for nesting the animations.

The output shall be the graphical output on the iPad for that given image and those animation attributes. The user will be able to immediately see the animated result of what they just defined.

### Error handling: How can programs go wrong, and how does your language communicate those errors to the user?

In terms of syntax errors, I am not anticipating any, as there shall be a well-defined set of actions that the user can do. Most likely it will just be that the animation will not do what the user envisioned, and that will be communicated through the fact that the animated image after they define it will look wonky. One consideration is how I want the user to make individual image, since if it is on the main canvas, then overlap of images can be troublesome for how to isolate the image. This is why I will use the "Commands" to allow the user to specify when an image is done so overlap is not a concern. I also need to make sure that the user cannot specify repeated animations to happen at the same time (as it would not make sense to rotate both clockwise and counterclockwise, or for one image to move in two directions).

Another error the user could run into is by making too many animations. It is possible that the app could crash from throwing too many things on the screen. As I feel it would be artificial-limiting to impose an image limit, as hardware could always be improving. I think I would prefer for this error to be communicated to the user simply through the fact that the iPad will be lagging in all the animations as the iPad can't handle it, and then crashing out when the hardware simply cannot handle it anymore (and so that would involve no extra error handling on my part).


### What tool support (e.g., error-checking, development environments) does your project provide?

My project will provide a pretty strict development environment, and that is through an iOS app. In terms of tool support, it will all be done through the app, as that is where the user will be able to interface with the language for creation, as well as run their animation to see the result. My goal is also to allow for the animations to be saved in some form, such as a gif, and so it can be exported to other environments (i.e. shared with others), although the development environment will simply be through the app.

### Are there any other DSLs for this domain? If so, what are they, and how does your language compare to these other languages?

There are a number of different DSLs in this domain. Perhaps the most prominent of these is Adobe Flash, as that is really the go-to application for animation. My language will be much lighter and specific in scope compared to Flash. The goal is to make it far easier to get started using my DSL, versus Flash which has a lot of capability, but also a big learning curve. 




STILL NEED TO ADD OTHER DSLS IN THIS DOMAIN





## Language implementation

### Your choice of an internal vs. external implementation and how and why you made that choice.

### Your choice of a host language and how and why you made that choice.

### Any significant syntax design decisions you've made and the reasons for those decisions.

### An overview of the architecture of your system.
