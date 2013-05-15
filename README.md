# Customized iOS UI elements

## Customized classes

* UICustomRoundButton
* UICustomColoredLabel
* UICustomTextButton, inspired in GlossButton:  https://github.com/Codepadawan/GlossButton
* UINumericKeyboard

## View

![This is the app main view.](/Documentation/ipad-screen.png "App view")

## Use

To see an example of how to use these classes, please, see the main ViewController class, in the path ios-custom-ui-elements/CustomElementsTest/CustomElementsTest/ViewController.m

For example, defining a UICustomRoundButton is as simple as:

``` objective-c
_roundButton1 = [[UICustomRoundButton alloc] initWithFrame:CGRectMake(x, y, width, heigth)
                                                      icon:[UIImage imageNamed:@"example"]
                                                     color:[UIColor colorWithRed:0.5 green:0.5
                                                                            blue:0.5 alpha:1]];
```

# Development

## Authors

* Juan Manuel Coello <juanma@nubiq.es>
* Noelia Sales <noelia@nubiq.es>

## Special thanks

* Chris Jones: http://github.com/Codepadawan
* Ray Wenderlich: http://www.raywenderlich.com/

