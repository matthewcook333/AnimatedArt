# November 4th Critique: Description and Plan - Paul Dapolito

## Guided Questions

### What are one or more things that you like about this project? What's exciting?

I really like how your project puts a powerful tool and domain-specific language right in the hands of users. We've seen, with the advent of advanced mobile technology, that users love to have software right in their hands. I love that your project fuels this worldwide interest.

Further than this, I found your motivation for the project as written in [description.md](https://github.com/matthewcook333/AnimatedArt/blob/master/documents/description.md) as well as your comments in class regarding your motivation for the project particularly interesting. I have tried to use Adobe Flash, an example you noted in class before to make simple animations, and I found it nearly impossible to learn and develop under the framework in an efficient manner. I also think your comments about "immediate feedback" are quite moving. It is painful to think of creating a frame-by-frame animation, and I am excited that your tool will overcome this barrier to entry in the animation space. 

I find the domain of your project to be profoundly interesting. I had never before considered how a domain-specific language could optimize and simplify the process of creating animations. I am really excited to see where this expansive and wide-reaching domain takes you with this project.

### What's the balance of language design vs sheer programming / engineering in this project?

I feel that you have a huge amount of design and a similarly large amount of engineering to complete for this project. I've tried to break down the different design initiatives that struck me immediately after reading your plan and description.

#### Initial Design Considerations (in my opinion)

   + What audience are you targeting as your first priority?
   	   + animation novices
   	   + DreamWorks employees
   + How will the user access and interact with the language?
   	   + drag and drop via an application
   		   + mobile
   		   + desktop
   	   + textually with a keyboard
   + Will images be incorporated into the language?
   	   + explicitly inputted
   	   + selected from within the framework
   	   + created from within the framework
   		   + drawn manually
   		   + derived from pre-defined shapes
   + Will users be able to create their own animations?
   	   + combining pre-defined animations
   	   + adding animations to the language

With these in mind, I feel that you definitely have a lot of language design to do before pushing forward with sheer programming. Given how expansive your domain is and how difficult this domain is to capture in a language, I do not think that this imbalance should be a cause of any worry.

### How can the project maximize the time spent on language design? How to focus on interesting, possibly new ideas?

I think a key component of designing your domain-specific language will be deciding how to deliver the language to users. This said, I would spend a lot of time designing an interface which will allow your users to create animations in a user-friendly way. This is a novel idea, for most other animation suites are quite difficult to use and interact with.

I remember, from class, you said that you might explore the route of creating a handheld (mobile) application to support your domain-specific language, and I think this is a really great and novel idea. With regard to how much freedom it seems like you are trying to give the user in terms of what animations they can produce, I think the design of the interface by which your users are presented with your domain-specific language is of utmost importance and is worth spending a lot of time on. 

## What are some interesting language design questions that the work will have to answer? In other words, what are the design challenges? Which design problems' solutions are you looking forward to hearing about at the end of the project?

As I mentioned previously, I think a very interesting language design challenge that you will face is designing the environment which houses your domain-specific language. I feel that another interesting challenge you will face is actually implementing the animations you wish to enable users to access more easily. The whole point of your project is to make animations more easy for users to produce, and in implementing this, you will have to build animations into your domain-specific language. We have already noted, by very nature of this project, that animations are a hard space to work in, so I am very interested to see how you overcome this challenge and build animations into your project!

### What are the primitives in this language?

I feel that the primitives in your domain-specific language are the various animations, and attributes for these animations, that you plan to include in the language. From your description, your animation primitives seem to be the following (so far):
   + rotation
   + oscillation 
   + translation
   + transparency/opacity
   + color changes

And the primitive attributes by which these animations can be altered are (so far):
   + speed
   + direction
   + color scale

I think that you broke down the animation space you wish to capture particularly well here. This will make your implementation process quite nice, as you can implement one animation at a time and then the associated attributes. In the end, this should allow you to combine different animations for some image in an efficient manner.

### Do you know of any libraries, languages, or projects that might help this project?

I think that you are right-in in talking about the drawbacks of Adobe Flash, and you should investigate the associated language, [ActionScript](http://www.adobe.com/devnet/actionscript.html), to see what things you might want to do differently.

Given that you were talking about making an application to house your domain-specific language, I have a few projects I can mention that might help you progress your thoughts on the project.

The first is one I used in middle school to add flash animations to HTML pages I was working on. It is called [BannerZest](http://www.aquafadas.com/en/animated-banners-creation/windows/index.php). You essentially inputted a logo or small image and then chose from a huge list of pre-made animations that the developer ([Aquafadas](http://www.aquafadas.com/)) built-in to the application. You could then save the animation as HTML and easily throw it on to a web page. What is lame about this software is that you have literally no control over any aspect of the animations you could produce: you are stuck using the hardcoded animations. In creating your domain-specific language, you should definitely think about how much flexibility you give your users in terms of being able to actually control the animations your DSL gives them access to.

The other resource I can refer you to look at is a Python library for creating visuals, called [pyglet](http://pyglet.org/). I am not sure whether or not you have decided on a platform to host your DSL, but in the case of creating a desktop client, pyglet might provide you with a wide degree of functionality. Regardless of your platform, though, pyglet is probably a good library to look at when developing your language. Pyglet's documentation on [animation techniques](http://pyglet.org/doc/programming_guide/animation_techniques.html) might be particularly helpful when you begin designing your syntax.

## General Comments

### [description.md](https://github.com/matthewcook333/AnimatedArt/blob/master/documents/description.md)

I feel like I left your description feeling a bit confused about what would be inputted into your language's environment and what variables would be up to the user to define. Are you going to allow users to physically draw on their animation canvas, or will they input images and then work to create animations with those inputs? I think either path will yield a great product, but the latter might allow you to spend more time on tackling more substantive and interesting design challenges.

I love your motivation for the project, and I thought a lot about how you described your DSL as enabling "living" images. I think this is a great idea and perhaps an iteration or prototype of your project. It would be very cool if a user could draw a stick figure and then use your DSL to make the figure jump, run, walk, or fall down. I am not sure if you were going to approach the animation perspective of your project at this high a level, but I definitely wanted to point out that the concept of creating "living" images might be a cool idea for you to consider.

Your description of your language's design is awesome, but I am wondering a bit about your discussion of errors. Is it your intention to create an environment for the DSL which does not allow users to "mess up"? Further than this, if you wanted to expand the project to allow users to create their own animations, I think you'd certainly need to look into checking the validity of an animation or series of animations. Something else I was thinking about was how you might limit the user from generating an animation which is too graphically complex, if that makes sense. I was imagining chaining together many different animations at high speeds and bringing forth an animation that could not be run on the graphics card of say, an iPad. Do you think this is a realistic issue?

### [plan.md](https://github.com/matthewcook333/AnimatedArt/blob/master/documents/plan.md)

When thinking about your plans to evaluate the language, I was a bit confused about your very first point. Are you planning on having a textual language by which users could create animations? I was thinking all along that your DSL and its supported grammar/syntax are completely driven by the user interface you create, but that does present an interesting distinction: would it be possible for users to express animations in your language by writing traditional textual programs?

I think the method by which you plan to test the DSL, via user testing, is a great idea! I feel that you should pursue all sorts of user testing, and especially get feedback from users who have experience creating animations, as they might come forth with interesting ideas or improvements for your project.

When looking at your implementation plan, it looks like you may have already decided on implementing an iOS host for the language, and I think this is a great idea. SpriteKit will make your development of animations very nice, and it will be cool to learn Swift along the way. Something I must note, though, is that you may find more support for Objective-C issues as you develop for iOS due to Swift's young age. I don't think this is a deal-breaker, but you might consider switching to Objective-C if you do not find much support on StackOverflow for particular problems that you come across while using Swift.

I think a huge strength of your plan for the project is the amount of flexible time you allow yourself, especially towards the end of the project. I think I was often too specific in my own planning, and I appreciate that your plan is able to help me rethink my own plan a bit.



