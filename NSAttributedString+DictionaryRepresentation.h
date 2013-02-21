//
//  NSAttributedString+DictionaryRepresentation.h
//  UAS8000
//
//  Created by Lin Junjie on 21/2/13.
//  Copyright (c) 2013 Clean Shaven Apps Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (DictionaryRepresentation)

+ (NSAttributedString *)attributedStringWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
