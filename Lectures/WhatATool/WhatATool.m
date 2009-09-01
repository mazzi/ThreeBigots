#import <Foundation/Foundation.h>
#import <Foundation/NSPathUtilities.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];  

	NSString *expanded = [@"My home folder is at " stringByAppendingString:path];
	NSLog(expanded);
	
	NSArray *listItems = [path pathComponents];
	
	NSEnumerator *en = [listItems objectEnumerator];
	
	while(path = [en nextObject]) {
		NSLog(path);
	}
		
    [pool drain];
    return 0;
}
