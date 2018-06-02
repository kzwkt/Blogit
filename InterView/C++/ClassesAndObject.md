### Classes and objects

- class keyword to define a class
    - a Trailing ; trips up C# devs

- private and public sections
    - Not line by line
    - Default is private
    - Best practice: no public membervariables
- Declare an instance with same syntax as fundamental types
- Access member variables and functions with .
    - Static members and functions with classname and ::

### Initializer Syntax

#### History
> when you create objects from the class like p1, is that first all of the member variables are given their memory and if they have default values they're defaulted. and then we change their value with new values that come in. if setting the value is expensive, this would be a real waste of time. because first member varialbe set up to default values, then changeing to values you really want. this is time consuming action.(consider set an array). so when your initializer are expensive, initializer sysntax is one the ways you make your application perform better.

- this idea of __initializer syntax__ is how defalt or initialize the member variable of the object.(so use initializer syntax just for constructor functions.)
consider the following code:
```c++
#include "Person.h"

Person::Person(std::string first, std::string last,
                int arbitrary)
{
    firstname = first;
    lastname = last;
    arbitrarynumber = arbitrary;
}
```
whats wrong with old manner?
1. its expensive for complex data type like array for initializing.

the code after applying initializer syntax would be something like this:
```c++
#include "Person.h"

Person::Person(std::string first, std::string last,
                int arbitrary) : firstname(first), lastname(last), arbitrarynumber(arbitrary)
{
}
```