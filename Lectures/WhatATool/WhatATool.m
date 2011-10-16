#import <Foundation/Foundation.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>

/* Section 1: Strings as file system paths */
void section1() {
	
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];  
	
	NSString *expanded = [@"My home folder is at " stringByAppendingString:path];
	NSLog(@"%@",expanded);
	
	NSArray *listItems = [path pathComponents];
	
	NSEnumerator *en = [listItems objectEnumerator];
	
	while(path = [en nextObject]) {
		NSLog(@"%@",path);
	}	
}

/* Section 2: Finding out a bit about our own process */
void section2() {
	
	NSProcessInfo *proceso = [NSProcessInfo processInfo];

	NSLog(@"Process Name: '%@' Process ID:'%d'", [proceso processName], [proceso processIdentifier]);	
}

/* Section 3: A little bookmark dictionary */
void section3(){
        
	NSMutableDictionary *aDictionary = [[NSMutableDictionary alloc] init];;
    
	[aDictionary setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Standford"];
    [aDictionary setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
    [aDictionary setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[aDictionary setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
    [aDictionary setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];

    NSLog(@"%@", aDictionary);
    
    NSArray *keys = [aDictionary allKeys];
    
	// values in foreach loop
	for (NSString *key in keys) {
        if ([key hasPrefix:@"Stanford"]) {
            NSLog(@"Key: '%@' URL: '%@'",key, [aDictionary objectForKey:key]);
        }
	}
     
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	section3();
	
    [pool drain];
    return 0;
}
