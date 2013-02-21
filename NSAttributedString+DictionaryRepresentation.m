//
//  NSAttributedString+DictionaryRepresentation.m
//  UAS8000
//
//  Created by Lin Junjie on 21/2/13.
//  Copyright (c) 2013 Clean Shaven Apps Pte. Ltd. All rights reserved.
//

// The plain text string
#define CSAAttributedStringStringKey			@"CSAAttributedStringStringKey"

// The dictionary containing the dictionary of range and attributes. The string
// representation of the range is the keys, while the attributes are the objects
#define CSAAttributedStringRangeAttributesKey	@"CSAAttributedStringRangeAttributesKey"

#import "NSAttributedString+DictionaryRepresentation.h"

@implementation NSAttributedString (DictionaryRepresentation)

+ (NSAttributedString *)attributedStringWithDictionary:(NSDictionary *)dictionary
{
	NSString *string = dictionary[CSAAttributedStringStringKey];
	if (!string)
		return nil;
	
	NSMutableAttributedString *attributedString =
	[[NSMutableAttributedString alloc] initWithString:string];
	
	NSDictionary *rangeAttributesDictionary = dictionary[CSAAttributedStringRangeAttributesKey];
	
	[rangeAttributesDictionary enumerateKeysAndObjectsUsingBlock:
	 ^(NSString *rangeKey, NSDictionary *attributes, BOOL *stop) {

		 NSRange range = NSRangeFromString(rangeKey);
		 if (range.length)
			 [attributedString setAttributes:attributes range:range];
	}];
	
	return attributedString;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *representation = [NSMutableDictionary dictionaryWithCapacity:2];
	representation[CSAAttributedStringStringKey] = self.string;
	
	NSMutableDictionary *rangeAttributesDictionary = [NSMutableDictionary dictionary];
	
	[self enumerateAttributesInRange:NSMakeRange(0, self.length)
							 options:0
						  usingBlock:
	 ^(NSDictionary *attrs, NSRange range, BOOL *stop) {
		 
		 @autoreleasepool {
			 NSString *rangeString = NSStringFromRange(range);
			 
			 if (rangeString)
				 rangeAttributesDictionary[rangeString] = attrs;
		 }
		 
	 }];
	
	representation[CSAAttributedStringRangeAttributesKey] = rangeAttributesDictionary;
	return representation;
}

@end
