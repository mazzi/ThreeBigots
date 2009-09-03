#import <Foundation/Foundation.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>

/* Section 1: Strings as file system paths */
void section1() {
	
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];  
	
	NSString *expanded = [@"My home folder is at " stringByAppendingString:path];
	NSLog(expanded);
	
	NSArray *listItems = [path pathComponents];
	
	NSEnumerator *en = [listItems objectEnumerator];
	
	while(path = [en nextObject]) {
		NSLog(path);
	}	
}

/* Section 2: Finding out a bit about our own process */
void section2() {
	
	NSProcessInfo *proceso = [NSProcessInfo processInfo];

	NSLog(@"Process Name: '%@' Process ID:'%d'", [proceso processName], [proceso processIdentifier]);	
}

/* Section 3: A little bookmark dictionary */
void section3(){
	
	// TODO Ver lecture 2 =)
	
	//NSMutableDictionary *aDictionary;
		
	//[[aDictionary objectForKey:@"Stanford University"] "http://www.stanford.edu"];
	
	//[aDictionary removeObjectForKey:theKey];
	//[anObject someMessage];
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	section3();
	
    [pool drain];
    return 0;
}
