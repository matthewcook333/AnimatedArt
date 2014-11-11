##Notebook critique
I think that the work that you're doing so far is great! Definitely agree with taking the time to really get to know the tools that you have available. Trying to get a handle on how swift handles animations will hopefully give you more insight on what is frustrating about trying to make animations in that language and how your DSL will handle those challenges. 

You mentioned that you're facing an issue where you have to decide between IOS core animation and SpriteKit. As Professor Ben mentioned in class,it's definitely a good idea to see which of these animation toolkits is closest to your Intermediate Representation, or which one will most easily be translated. 

You brought up an interesting point in that the syntax of your language isn't text based. Even though it isn't text based, I think you have to be very careful and clear in your description of what a program will actually look like, and what is expected of the user hoping to usew your DSL. I feel that while it's not text based, having a solid but basic outline of what the development process in your DSL looks like is essential for your ability to make future design decision, like choosing what animation kit to use or how you will handle nested object with distinct animations. You started discussing in your design and implementation document how the basic data structure will function, but I think that ironing out things in a bit more detail would be good. Specifically I'd like no know more about how the user will be able to decide how the object is animated given that they have a predefined set of animations. Will these animations take some input that is given by the user gesturally? So, for example, when the user want to animate the legs of the stick man, will the user have to select pivot points and moving locations after defining the animation as oscillating?

Will the stick man have separate objects within it? So are the legs separate from the body? If so, how does one let your program know what when the legs are moving, the stickman should move to the left or right all together to make the animation of walking? 


I think a good idea would be to make some sketches out and imagine it's your program and write down a frame for each step. This will give you a better idea of what your DSL syntax is.  


 



##Language Design and Implementation Critiques (so far) 

I think it's awesome that you already started to work on this document! I think it's a good start, but as I mentioned above, I think being a bit more detailed on some parts will be helpful to us as critique partners and to you while making design decisions. You did a good job at describing what is going on at a high level, but there are several small details that are missing that I think haven't been communicated. Given that you are making a touch based input and your DSL is very visual, a really good way to give an explanation for language design is to use images and sketches! Show step by step what using the language would look like for the user. 

Another small detail but it would be nice if you used headings or bolded the questions so your page is easier to read. 



##Questions from notebook

####Do you have any recommendations for how users should be able to specify chain of animations? 

You're general outline for what you expect users to input is good: 

* User draws object
* User chooses animation for object
* User can see the animations 

What is missing are the steps that are taken in each. When a user draws an object, can they select the important points that make up the animations? Can user define speed of animation? If a user want to animate several pieces at the same time, do they need have to define that same animation for each object? How does a user take off animations? I'm assuming there will have to be some kind of looping, is this something that the user can define, or is it pre-set in the animations?  

####Is there anything I can do before the deliverable s of design and implementation to concretely show what I am trying to do?

I've discussed a few things already, but specifically I'd just like an outline of the development process from the user perspective. Ideally this would be simple sketches showing each step. I really like the stick man example that you've been using. It would be great if you could show us visually what you believe the process for making that animation would be. A good example of sketches is Chloe [here](https://github.com/cvcal/NoteMatrixWithTonality/tree/master/documents/initial_examples)

#### What is confusing/concerning as of now that I should address?

I think at a high level everything makes sense, but the things that need to be addressed are those small details. Specificity will really make designing the language nice. Having a solid set of steps a user takes to make an animation will be helpful. While trying to imagine what your DSL looks like, not having these details makes it difficult for me to see how I will be able to define things. 