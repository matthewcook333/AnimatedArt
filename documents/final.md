##Introduction##

Animations are an important form of visual art, one that allows for a variety of creative outlets.
The typical way to create animations is through frame-by-frame static images, and stringing them together
to create a moving picture. The purpose of my Domain-Specific Language is to allow users to easily create
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

