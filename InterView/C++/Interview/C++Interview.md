<h1 align="center">
	<img width="400" src="interview.jpg" alt="interview">
	<br>
</h1>

### Life Cylce of C++ Program
> Editor -> Preprocessor -> Compiler -> Linker -> Loader -> CPU

- **Editing**: Used for writing source code to store on disk
- **Preprocessing**: Program is processed by the preprocessor program to insert preprocessor directives to compile code 
- **Compilation**: Object code created to store on the disk
- **Linking**: Object code and libraries linked to create an executable file for storing on the disk
- **Loading**: To puts the program in memory
- **CPU**: It takes each instruction for execution. Possibly stores new data values as the program executes. 

###  What is Compilation and linking?
Once you have finished typing the source code, it is required to convert it into the machine language - binary with 0s (zeros) and 1s (ones) for its execution. Here the role of compiler actually begins.

> "The compilation is the way to change a source file into object file with .OBJ extension, containing machine language instructions that can be executed by the computer". 

But what when you are working on a large software where more than one programmers are working on its different modules? In such an Integrated Development Environment (IDE) like Visual Studio, another step ‘Linking’ is required to link these separate and small modules to the main module. 

> “The linking process combines multiple object files into a single executable program”. 
### Header Files vs Source files

- Foo.h -> contains declaration (interface) for class Foo.
- Foo.cpp -> contains definition (implementation) for class Foo.
- Main.cpp -> contains main method, program entry point. This code instantiates a Foo and uses it.

### Why we need header files?

(1) It speeds up compile time. As your program grows, so does your code, and if everything is in a single file, then everything must be fully recompiled every time you make any little change. This might not seem like a big deal for small programs (and it isn't), but when you have a reasonable size project, compile times can take several minutes to compile the entire program. Can you imagine having to wait that long between every minor change?

Compile / wait 8 minutes / "oh crap, forgot a semicolon" / compile / wait 8 minutes / debug / compile / wait 8 minutes / etc

(2) It keeps your code more organized. If you seperate concepts into specific files, it's easier to find the code you are looking for when you want to make modifications (or just look at it to remember how to use it and/or how it works).

(3) It allows you to separate interface from implementation. If you don't understand what that means, don't worry, we'll see it in action throughout this article.

Those are the upsides, but the big, obvious downside is that is makes things a little more complicated if you don't understand how it all works (in reality, though, it's simpler than the alternatives as the project gets larger)

C++ programs are built in a two stage process. First, each source file is compiled on its own. The compiler generates intermediate files for each compiled source file. These intermediate files are often called object files -- but they are not to be confused with objects in your code. Once all the files have been individually compiled, it then links all the object files together, which generates the final binary (the program).

This means that each source file is compiled separately from other source files. As a result of this, in terms of compiling, "a.cpp" is clueless as to what's going on inside of "b.cpp". Here's a quick example to illustrate:

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">