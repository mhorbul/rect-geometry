//
//  HelpPrototypeViewController.m
//  HelpPrototype
//
//  Created by mhorbul on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "HelpPrototypeViewController.h"

@interface UIView (Geometry)
-(BOOL)isVisible;
@end

@implementation UIView (Geometry)

-(BOOL)isVisible {
	NSArray *views = [[self superview] subviews];
	for (UIView *view in views) {
		CGRectContainsRect(view.frame, self.frame);
	}
	return YES;
}


@end


@interface HelpPrototypeViewController (Actions)

-(void)displayPositions;
-(UIImage *)screenCapture;

@end

@implementation HelpPrototypeViewController (Actions)

-(UIImage *)screenCapture {
	UIGraphicsBeginImageContext(self.view.frame.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return viewImage;
}

-(void)displayPositions {
//	NSString *tempFileName = [NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"png"];
//	NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:tempFileName];
//	NSData *imageData = UIImagePNGRepresentation(screenImage);
//	[imageData writeToFile:tempFilePath atomically:YES];
	
	[_square_red isVisible];
	[_square_green isVisible];
	
	if([[self.view.layer sublayers] count] == 5) {
		[[[self.view.layer sublayers] objectAtIndex:4] removeFromSuperlayer];
	}else{
		CALayer *layer = [[CALayer alloc] init];
		UIColor *bgColor = [[UIColor alloc] initWithRed:255.0f green:255.0f blue:255.0f alpha:0.8f];
		[layer setBackgroundColor:[bgColor CGColor]];
		[layer setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
		[self.view.layer addSublayer:layer];
		
//		UIImage *screenImage = [self screenCapture];
//		
//		CGRect maskFrame = _square_green.frame;
	}
}

@end


@implementation HelpPrototypeViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	_square_red = [[UIView alloc] initWithFrame:CGRectMake(60.0f, 60.0f, 100.0f, 100.0f)];
	[_square_red setTag:1];
	[_square_red setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:_square_red];
	
	_square_blue = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 210.0f, 210.0f)];
	[_square_blue setTag:2];
	[_square_blue setBackgroundColor:[UIColor blueColor]];
	[_square_blue setAlpha:0.8f];
	[self.view addSubview:_square_blue];
	
	_square_green = [[UIView alloc] initWithFrame:CGRectMake(150.0f, 150.0f, 100.0f, 100.0f)];
	[_square_green setTag:3];
	[_square_green setBackgroundColor:[UIColor greenColor]]; 
	[self.view addSubview:_square_green];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button addTarget:self action:@selector(displayPositions) forControlEvents:UIControlEventTouchDown];
	[button setFrame:CGRectMake(130.0f, 350.0f, 100.0f, 30.0f)];
	[self.view addSubview:button];
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
