# Critique for Week of November 9-16th.

## Reactions and Answers to Matt's questions

* Do the current set of animations/commands seem interesting enough to you? 

  Yes, they seem interesting. The main animation features you describe are movement along a path, rotation, and oscillating around a pivot (is this like a pendulum?) These already allow for a pretty diverse set of animations, especially with the options to chain, stack ('while' seems an odd word for this, maybe), and nest multiple objects under a single animation umbrella. I found one aspect of the animation somewhat confusing at first glance - do you have any concept of the duration of an animation, especially when chaining them? This is especially relevant for the oscillation animation, that doesn't have an explicit beginning and end point.
  
  One questions I have is whether or not you will allow a path to bring an image off-screen. Or if the path can't be drawn to go completely off the edge of the screen, whether parts can be cropped off, effectively "hiding" off screen. I'm imagining that the path the user provides is linked to the center of the object, so extremities might disappear for certain positions of the object.
  
* Is there something you see missing that you would love to have if you were making your own creation? 
  
  From the perspective of a potential user, there are two features I can see being useful. 

  One is the possibility to change the size of an image, having it grow or shrink. You have this mentioned in one of your chalkboard drawings, but I don't see it mentioned elsewhere as much. This would be easy for geometric shapes, but probably wouldn't look so nice for hand-drawn object, unless you're storing the object as a series of strokes and vectors, and not as a bitmap. This could add some really cool effects when paired with rotation and motion. 
  
  The other feature I was wondering about was how a user might make an animation for a specific period. Currently, you talk of looping animations, but these might last different times, so your 15-second loop object and your 17-second loop will almost never be in sync, which is cool, but it makes it difficult to think of how to store this as a 'movie' or something: where in the series of loops would you start? This question brings in other potential features: could you introduce new objects after a certain amount of time, or make objects disappear after another stretch? This could create scenes and a sense of time and progress through a narrative, as opposed to simple looping objects. I feel this is a pretty strong diversion from where you're at, but I feel that the ability to make easy animations is most useful if you can somehow store it, though it is also really cool as a toy that you can mess with for fun without any product coming out the other side.

* If you have experience in iOS development, do you have particular suggestions for design choices/things to use for my project?

  I can't help you much there. I think your decision to avoid spriteKit was well-founded. This might actually lead you to some insight about what would be easy to add, just by looking at the basics of what the CoreAnimation library can do. For example, simple extra tools like transitioning the background color would be relatively trivial to add, and might make a lot of sense for the user. As you can undoubtedly see from my answer, though, I'm viewing this very much from the user's end, and am having difficulty diving into the implementation considerations. Since you aren't planning on letting users play directly with the code, but program the animation through the UI, you can take advantage of this to test a bunch of possible features, see how easily you can make the animations happen, and considering how you might have the user input the necessary values. If you don't include something in your UI, your user'll never know, so it shouldn't be too disruptive.
  
  
