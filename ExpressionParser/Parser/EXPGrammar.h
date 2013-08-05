//
//  EXPGrammar.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A thin wrapper around CPGrammar for setting up the math grammar.
*/
@interface EXPGrammar : NSObject

/**
 The configured grammar.
 */
@property (readonly) CPGrammar *grammar;

@end
