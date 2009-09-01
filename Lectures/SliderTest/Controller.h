#import <UIKit/UIKit.h>

@interface Controller : NSObject /* Specify a superclass (eg: NSObject or NSView) */ {
    IBOutlet UILabel *label;
    IBOutlet UISlider *slider;
}

- (IBAction)sliderChanged:(id)sender;

@end
