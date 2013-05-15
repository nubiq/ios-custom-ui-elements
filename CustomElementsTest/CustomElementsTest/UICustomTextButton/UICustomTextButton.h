//
//  UICustomTextButton.h
//  procyon
//
//  Created by Chris Jones.
//  Copyright 2011 Chris Jones. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// Link: https://github.com/Codepadawan/GlossButton
//
// This code has been modified to work in iOS 5 or higher.
//
// Code modified by:
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>

@interface UICustomTextButton : UIButton {
    BOOL _selected;
	BOOL _toggled;
    NSInvocation *_invocation;
    UILabel *_label;
	BOOL _pause;
	int _buttonStyle;
	
	CGFloat _hue;
    CGFloat _saturation;
    CGFloat _brightness;
}
@property  int buttonStyle;
@property (nonatomic) BOOL selected;
@property (nonatomic) BOOL toggled;
@property  BOOL pause;
@property (retain) NSInvocation *invocation;
@property  CGFloat hue;
@property  CGFloat saturation;
@property  CGFloat brightness;
@property (retain) UILabel *label;

- (id)initWithText:(NSString *)text target:(id)target selector:(SEL)selector;
- (id)initWithTextAndHSB:(NSString *)text target:(id)target selector:(SEL)selector hue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness;
- (void) setLabelWithText:(NSString *)text andSize:(float)size andVerticalShift:(float)shift;

@end