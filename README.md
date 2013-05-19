# HTMLEncoder

A simple Objective-C library that lets you create a HTML document/string, without having to manually deal with string manipulation.

## Example:

### Code
``` objective-c
HTMLTableCell *cell = [[HTMLTableCell alloc] init];
[cell setContent:@"This is a cell in a table!"];
[cell setClasses:@"Class", nil];

HTMLTableRow *row = [[HTMLTableRow alloc] init];
[row addChild:cell];

HTMLTable *table = [[HTMLTable alloc] init];
[table addChild:row];

//Add some styling
CSSStyle *css = [[CSSStyle alloc] init];
[css setColor:@"red"];
[css setBackgroundColor:@"blue"];
[css setWidth:@"200px"];
[cell setStyle:css];

//Html result
NSLog(@"Html: %@", table.domObject);
```


### Output
``` html
Html: <table><tr><td class="Class" style="color: red; background-color: blue; width: 200px; ">This is a cell in a table!</td></tr></table>
```


## DOM Objects

Not all DOM objects are available yet.
You can create or do any custom html object by using the base DOMObject class and giving a base html tag.

### Example

``` objective-c

//Initializes the DOMObject with initWithTag, and pass the tag name
DOMObject *customObject = [[DOMObject alloc] initWithTag:@"custom"];
[customObject setContent:@"Hello world!"];

NSLog(@"Html: %@", customObject.domObject);

```
### Output

``` html
Html: <custom>Hello world!</custom>
```
