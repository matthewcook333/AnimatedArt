##Introduction##

Animations are an important form of visual art, one that allows for a variety of creative outlets.
The typical way to create animations is through frame-by-frame static images, and stringing them together
to create a moving picture. The purpose of my domain-specific language is to allow users to easily create
simple animations without the need to creating repetitive images. For simple animations, there may only
be a number of actions the user would need, and so this could be done through simply describing what
those animations are, rather than drawing out each frame.

The DSL will be used as a tool with an interactive canvas to allow the user to draw an image, and then 
describe what they want it to do, such as rotate or oscillate in some way. Doing so, they can easily 
make a moving image without the need to draw all of the frames of that action. The user interacts with
the language through a graphical interface, making it easy for the user to draw what they would like,
and simply tap any of the animations at their disposal without needing to learn the language ahead
of time.

###Language Design Details###

The uaser writes programs in the language through a Graphical User Interface (GUI) on the iPad. The user does this by drawing some picture on the "canvas", or drawing area, and then in the Animations Menu, chooses the animations they would like for that drawing. For example, the user could choose to have a rotating drawing, in which case they would choose the direction (e.g. clockwise or counterclockwise) and the speed of the rotation. Or they could be choosing for the image to move across some path, and the user would then draw the path, as well as the speed for the image to traverse it. Another type of animation would be oscillation, where the user selects the point of oscillation on the screen, the degrees of oscillation, and the speed. Other animations include expansion/scaling and transparency/opacity. 

After choosing the animations, the user would see the image immediately animating on the canvas, so the user can tweak and alter the animation as desired. After they are done with the current animation, they could add another by simply choosing another animation in the menu, or choose to be "Done" with the current animation. In choosing to be done, that image is in its finished state and the user can draw another image without affecting that previous drawing. That done drawing will simply continue to animate on the screen. Another control structure is to choose to "chain" animations, where the user can specify that they would like another animation to happen AFTER the current one, to the same image. Doing so will refresh the animations menu, but as the user manipulates the animations, it will still affect the same drawing. Lastly, the user can choose to nest animations, which is similar to "done" in the sense that the user moves on to the next drawing, but now the new drawing will also copy all of the animations of the previous drawing, allowing them to be sychronized. With these tools, the user can create a "living" drawing, with all of the elements on the canvas animated in a way the user desires.

In terms of error handling, the main goal is to disallow for invalid animations and drawings. That is, the user will only be able to draw on the canvas area, and all of the usable animations should interact fine with each other. One of the major errors that could happen is for too many animations occurring on the screen at one time for the hardware to handle. In this case, the app will start slowing down and lagging until crashing, which I think is better as the user should know that it is due to all of the animations they created moving around. If I were to limit the number of animations and images, that would be worst as different hardware can handle different amounts of load and also hardware will simply continue to get better.

There are other DSLs that exist in this domain. The most prominent of which is Adobe Flash, which is one of the go-to applications for animation. My language will be much lighter and specific in scope compared to Flash. The goal of my language is to make it much easier to get started making the animations. Flash is very powerful and has a lot of capabilities, but also has an overwhelming learning curve for a casual user who just wants to make something simple. Beyond static frame-by-frame, Flash actually has similar capabilities to mine to allow for putting an image in location, and then another, and using a "tween" which makes a path to animate between those two. This kind of capability in Flash is a bit of what I am going for with my language. 

There are already some other DSLs such as ActionScript. This is similar to what I am trying to do in regards to having specific animations. One of the main differences is the purpose of the language, as mine is to allow for a creative outlet for drawing and animating them quickly, whereas ActionScript is well-suited for tinkering with a specific animation of an image to make sure to get it right. BannerZest is another one DSL which allows for very cool, involved animations of words and banners. By limiting their domain to certain types of words and banners, they can make more creative animations, but on the other hand the thing they are animating is much more constrained. Another example would be Pyglet, a library for python for animation. This would be more similar to the backend of my language with "Core Animation" in iOS, and so would have similar capabilities, but like Flash, would be harder to learn and easily manipulate new animations.

###Example Programs###

It is a bit more difficult for me to simply have an already created sample program with an iOS application, so instead I will just have a step-by-step guide for how to make something simple in my language.

***TODO: ADD PICTURES FOR TUTORIAL***


###Language Implementation###

The host language for my language is Swift. I chose Swift as the host language as I knew I wanted to develop a touch-based app, which would be more natural to do in Swift/Objective-C or Java. Swift/Objective-C has very robust API for animations simply in the core library through Core Animation, and iOS development is something I am more familiar with. I decide on Swift over Objective-C primarily because I was really interested in learning Swift as a language and the features it offers, as well as Swift having most of the basic libraries I will need for general architecture of the app as well as Core Animation. 

I suppose my language is more of an external DSL since the input is touch-based. The internal representation is then done with the use of CoreAnimation (CA) and the use of CALayers to keep track of them. I chose an external DSL because I wanted the creative process of making these drawn animations interactive, and by defining this through text and strict syntax would go against that goal. The  natural way to do this would necessarily be an "external" DSL, as the input is through a GUI rather than specific syntax of some programming language.

For internal representation, the drawings made by the user are kept track of by a UIBezierCurves as paths. For rendering, the paths are made into UIImages, which are then stored within a CALayer added to the main drawing view. This is continually updated as the user draws, and the view keeps track of one current "Animatable", which is a CALayer. The animations selected are then added to the Animatable with the specified attributes with a given key (some string). These keys are used to modify and remove given animations.

For execution of the code, that is simply done through the Core Animation Layers, as by adding animation attributes to a layer, the display updates with the animation with each refresh. I tried to structure the semantics of my DSL to most closely match the semantics of Core Animation in Swift (i.e. make adjustable attributes similar to the attributes of Core Animations). I went through a couple iterations of figuring out how to animate correctly, as originally I had the main manipulatable object as a UIImageView, although through implementation realized that was just an extra level of unneeded indirections as I needed CALayers for animation. 

Here is an overall architecture of the system 
***TODO: diagram of overall architecture***

###Evaluation###







