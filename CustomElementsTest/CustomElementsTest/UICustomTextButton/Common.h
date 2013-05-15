//
//  Common.h
//  CoolTable
//
//  Created by Ray Wenderlich on 9/29/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
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

#import <Foundation/Foundation.h>

#define kHighlightTop 0
#define kHighlightBottom 1

void drawLinearGradient(CGContextRef context, CGRect rect, UIColor *startColor, UIColor *endColor);

void drawLinearGloss(CGContextRef context, CGRect rect, BOOL reverse);

void drawCurvedGloss(CGContextRef context, CGRect rect, CGFloat radius);

CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius);

CGMutablePathRef createRoundedRectForRectCCW(CGRect rect, CGFloat radius);

NSNumberFormatter *standardNumberFormatter();