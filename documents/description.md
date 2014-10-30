# Project description and plan

The project idea is to make a DSL that can be used on an interactive canvas for "living" drawings. As you draw each element onto the canvas, the images would be animated as that happens. This will be a visual DSL that will be primarily driven by touch-based interaction to allow the user to specify what they are trying to define, which is each element on the canvas, and as a whole, the entire animation.

## Motivation
Currently, making an animation or dynamic image typically involves either a pretty tedious process of static frame by frame drawing, or complicated tools to allow for advanced animation techniques. This tool would allow people who are inexperienced or unable to use such tools to be able to make simple, repeating animations very quickly. In addition to this, the overall design also allows the user to have the immediate feedback of the animation rather than needing to imagine the entire animation as a whole. A DSL is an appropriate solution because there should be a very specified syntax for how these "living" images should be defined, as the attributes for an animation could be complicated (e.g. rotation could be define in multiple ways of direction, pivot point, speed. And then if you also allow translation while rotating, how the translation should be defined relative to the rotation for the direction to move).



## Language domain

The domain is dynamic drawings/images, or looping animations. The domain is useful because currently it can be easy to make a single static drawing, but tedious or technical to make dynamic drawings. This can be appealing to creative people, from casual users who want to simply have an alternative to static art, to possibly more experienced animators/artists, who want to quickly prototype an idea. 

Another DSL that is in this domain would be Adobe Flash, which is an extremely powerful tool for making animations, but has a high learning curve as well as cost, and so is a bit infeasible to use to create simple animations without prior experience. On the other end of the spectrum, there are very simple gif makers (e.g. gifmaker.me) which allow you to put together multiple images at a specified speed, but this process can be very tedious to repeatedly make each frame, and requires a fair amount of planning to create rather than really being able to make animations quickly on the fly. My DSL would try to take concepts that may exist in Adobe Flash, but a strict subset that can be used intuitively in the smaller domain of making very simple, looping animations. Implementation-wise, I may want something similar to a gif maker for how to define the attributes of a given animation (e.g. the duration of a given loop).

## Language design

My DSL's design is to allow for visually creating well-defined animation attributes for images. A program running would be taking each one of these defined images, and animating it on an overall canvas. The inputs would be an image/drawing, attributes for type of animation (e.g. rotation, oscillation, translation, transparency/opacity, color changes, etc.), the description of that animation (e.g. speed, direction, color scale), as well as possibly nested definitions. For example, you could make a stick figure that translates across the canvas, and then have nested drawings for the legs that oscillate, allowing the the stick figure to look like it is walking. The output is to define this animation within the host language, which can then be run. Not quite sure which data or control structures would be useful, but it would be useful possibly to look at how iOS, Android, or others define a given animated object for how this should be defined as that will be how it is animated. 

In terms of errors, there are unlikely to be syntax or compile time errors as the user interface would allow for a limited set of definitions. One type of error could possibly be for how it animates to simply not be how the user intended for that to animate. The design would be to allow each individual image to be immediately animated for feedback, that then the user could tweak to be how they envisioned it to look.

## Example computations

## Language evaluation

## Implementation plan

## Teamwork plan
