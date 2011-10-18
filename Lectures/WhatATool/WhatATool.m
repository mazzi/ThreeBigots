#import <Foundation/Foundation.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>

#import "PolygonShape.h"

/* Section 1: Strings as file system paths */
void PrintPathInfo() {
	
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
void PrintProcessInfo() {
	
	NSProcessInfo *proceso = [NSProcessInfo processInfo];

	NSLog(@"Process Name: '%@' Process ID:'%d'", [proceso processName], [proceso processIdentifier]);	
}

/* Section 3: A little bookmark dictionary */
void PrintBookmarkInfo(){
        
	NSMutableDictionary *aDictionary = [[NSMutableDictionary alloc] init];
    
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
    
    [aDictionary release];
}


/* Section 4: Selectors, Classes and Introspection */
void PrintIntrospectionInfo(){

    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    
    [myArray addObject:[NSString stringWithFormat:@"Cadena1"]];
    [myArray addObject:[NSNumber numberWithInt:65]];
    [myArray addObject:[NSString stringWithFormat:@"Cadena2"]];
    [myArray addObject:[NSNumber numberWithInt:99]];
    
    for(NSObject *obj in myArray) {
        NSLog(@"Class name   : '%@'", [obj className] );
        
        NSString *member = @"Is member of NSString";
        if ([obj isMemberOfClass:[NSString class]]) {
            NSLog(@"%@", [member stringByAppendingString: @" YES"]);
        } else {
            NSLog(@"%@", [member stringByAppendingString: @" NO"]);
        }
        
        NSString *kind = @"Is kind of NSString";
        if ([obj isKindOfClass:[NSString class]]) {
            NSLog(@"%@", [kind stringByAppendingString: @" YES"]);
        } else {
            NSLog(@"%@", [kind stringByAppendingString: @" NO"]);
        }
        
        NSString *lowerCase = @"Responds to lowercaseString";
        if ([obj respondsToSelector:@selector(lowercaseString)]) {
            NSLog(@"%@", [lowerCase stringByAppendingString: @" YES"]);
            NSLog(@"lowercaseString is : '%@'", [(NSString *)obj lowercaseString] );
        } else {
            NSLog(@"%@", [lowerCase stringByAppendingString: @" NO"]);
        }
    }
    
    [myArray autorelease];
}

void PrintPolygonInfo() {
    
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    
    
    PolygonShape *poly1 = [[PolygonShape alloc] initWithNumberOfSides:4 
                                  minimumNumberOfSides:3
                                  maximumNumberOfSides:7];    
    PolygonShape *poly2 = [[PolygonShape alloc] init];
        [poly2 setMinimumNumberOfSides:5];
        [poly2 setMaximumNumberOfSides:9];
        [poly2 setNumberOfSides:6];
                        
    PolygonShape *poly3 = [[PolygonShape alloc] init];
        [poly3 setMinimumNumberOfSides:9];
        [poly3 setMaximumNumberOfSides:12];
        [poly3 setNumberOfSides:12];

    [myArray addObject:poly1];
    NSLog(@"%@", [poly1 description]);
    [myArray addObject:poly2]; 
    NSLog(@"%@", [poly2 description]);
    [myArray addObject:poly3]; 
    NSLog(@"%@", [poly3 description]);
    
    
    for (PolygonShape *poly in myArray) {
        [poly setNumberOfSides:10];
    }
    
    [poly3 release];
    [poly2 release];
    [poly1 release];
    [myArray release];
    
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
    //PrintPathInfo();
    //PrintProcessInfo();
    //PrintBookmarkInfo();
	//PrintIntrospectionInfo();
    PrintPolygonInfo();
	
    [pool drain];
    return 0;
}
