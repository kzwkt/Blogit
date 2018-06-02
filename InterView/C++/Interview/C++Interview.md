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

```c++
// in myclass.cpp

class MyClass
{
public:
  void foo();
  int bar;
};

void MyClass::foo()
{
  // do stuff
}
```
```c++
// in main.cpp

int main()
{
  MyClass a; // Compiler error: 'MyClass' is unidentified
  return 0;
}
```

Even though MyClass is declared in your program, it is not declared in main.cpp, and therefore when you compile main.cpp you get that error.

This is where header files come in. Header files allow you to make the interface (in this case, the class MyClass) visible to other .cpp files, while keeping the implementation (in this case, MyClass's member function bodies) in its own .cpp file. That same example again, but tweaked slightly:


The #include statement is basically like a copy/paste operation. The compiler will "replace" the #include line with the actual contents of the file you're including when it compiles the file.

> in .h files we say that these functions just exists without implement them. other files include just .h files and they just need to know those functions exists withous knowing about their implemantation.

###  What is the difference between .h/.cpp/.hpp/.cc/etc

All files are fundamentally the same in that they're all text files, however different kinds of files should have different extensions:

- Header files should use a .h__ extension (.h / .hpp / .hxx). Which of those you use doesn't matter.
- C++ Source files should use a .c__ extention (.cpp / .cxx / .cc). Which of those you use doesn't matter.
- C Source files should use .c (.c only).

The reason C and C++ source files are seperated here is because it makes a difference in some compilers. In all likelyhood (since you're reading this on a C++ site), you'll be using C++ code, so refrain from using the .c extension. Also, files with header extensions might be ignored by the compiler if you try to compile them.

So what's the difference between Header files and Source files? Basically, header files are #included and not compiled, whereas source files are compiled and not #included. You can try to side-step these conventions and make a file with a source extension behave like a header or vice-versa, but you shouldn't. I won't list the many reasons why you shouldn't (other than the few I already have) -- just don't.

The one exception is that it is sometimes (although very rarely) useful to include a source file. This scenario has to do with instantiating templates and is outside the scope of this article. For now... just put it in your brain: "do not #include source files"

## Why need include guard?

C++ compilers do not have brains of their own, and so they will do exactly what you tell them to. If you tell them to include the same file more than once, then that is exactly what they will do. And if you don't handle it properly, you'll get some crazy errors as a result:
```c++
// myclass.h

class MyClass
{
  void DoSomething() { }
};
```

```c++
// main.cpp
#include "myclass.h"   // define MyClass
#include "myclass.h"   // Compiler error - MyClass already defined
```

Now you might be saying to yourself "well that's stupid, why would I include the same file twice?" Believe it or not, it will happen a lot. Not quite as illustrated above, though. Usually it happens when you include two files that each include the same file. Example:
```c++
// x.h
class X { };
```

```c++
// a.h
#include "x.h"

class A { X x; };
```

```C++
// b.h
#include "x.h"

class B { X x; };
```

```C++
// main.cpp

#include "a.h"  // also includes "x.h"
#include "b.h"  // includes x.h again!  ERROR
```

Because of this scenario, many people are told not to put #include in header files. However this is bad advice and you should not listen to it. Sadly, some people are actually taught this in C++ courses that they are paying money for. If your C++ instructor tells you not to #include in header files, then [grudgingly] follow his instructions in order to pass the course, but once you're out of his/her class, shake that habit.

The truth is there is nothing wrong with putting #include in header files -- and in fact it is very benefitial. Provided you take two precautions:

1) Only #include things you need to include (covered next section)
2) Guard against incidental multiple includes with include guards.

An Include Guard is a technique which uses a unique identifier that you #define at the top of the file. Here's an example:
```C++
//x.h

#ifndef __X_H_INCLUDED__   // if x.h hasn't been included yet...
#define __X_H_INCLUDED__   //   #define this so the compiler knows it has been included

class X { };

#endif 
```

This works by skipping over the entire header if it was already included. __X_H_INCLUDED__ is #defined the first time x.h is included -- and if x.h is included a second time, the compiler will skip over the header because the #ifndef check will fail.

Always guard your headers. Always always always. It doesn't hurt anything to do it, and it will save you some headaches. For the rest of this article, it is assumed all header files are include guarded (even if I don't explicitly put it in the example).

You do not need to guard your .cpp files, because they are not #included (Or at least they shouldn't be... right? RIGHT?)


### Why do we need to include the .h while everything works when including only the .cpp file?
While you can include .cpp files as you mentioned, this is a bad idea.

As you mentioned, declarations belong in header files. These cause no problems when included in multiple compilation units because they do not include implementations. Including a the definition of a function or class member multiple times will normally cause a problem (but not always) because the linker will get confused and throw an error.

What should happen is each .cpp file includes definitions for a subset of the program, such as a class, logically organized group of functions, global static variables (use sparingly if at all), etc.

Each compilation unit (.cpp file) then includes whatever declarations it needs to compile the definitions it contains. It keeps track of the functions and classes it references but does not contain, so the linker can resolve them later when it combines the object code into an executable or library.

Both Foo.cpp and Main.cpp need to include Foo.h. Foo.cpp needs it because it is defining the code that backs the class interface, so it needs to know what that interface is. Main.cpp needs it because it is creating a Foo and invoking its behavior, so it has to know what that behavior is, the size of a Foo in memory and how to find its functions, etc. but it does not need the actual implementation just yet.

The compiler will generate Foo.o from Foo.cpp which contains all of the Foo class code in compiled form. It also generates Main.o which includes the main method and unresolved references to class Foo.

Now comes the linker, which combines the two object files Foo.o and Main.o into an executable file. It sees the unresolved Foo references in Main.o but sees that Foo.o contains the necessary symbols, so it "connects the dots" so to speak. A function call in Main.o is now connected to the actual location of the compiled code so at runtime, the program can jump to the correct location.

If you had included the Foo.cpp file in Main.cpp, there would be two definitions of class Foo. The linker would see this and say "I don't know which one to pick, so this is an error." The compiling step would succeed, but linking would not. (Unless you just do not compile Foo.cpp but then why is it in a separate .cpp file?)

Finally, the idea of different file types is irrelevant to a C/C++ compiler. It compiles "text files" which hopefully contain valid code for the desired language. Sometimes it may be able to tell the language based on the file extension. For example, compile a .c file with no compiler options and it will assume C, while a .cc or .cpp extension would tell it to assume C++. However, I can easily tell a compiler to compile a .h or even .docx file as C++, and it will emit an object (.o) file if it contains valid C++ code in plain text format. These extensions are more for the benefit of the programmer. If I see Foo.h and Foo.cpp, I immediately assume that the first contains the declaration of the class and the second contains the definition.

### Generics Vs Templates
1. generics resolve at runtime
2. templates resolve at compile time

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">