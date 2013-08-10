//
//  EXPGrammar.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const EXPGrammarTagTerm;
extern NSString * const EXPGrammarTagFactor;
extern NSString * const EXPGrammarTagExpression;
extern NSString * const EXPGrammarTagOp;
extern NSString * const EXPGrammarTagFunction;
extern NSString * const EXPGrammarTagFunctionName;
extern NSString * const EXPGrammarTagIdentifier;
extern NSString * const EXPGrammarTagIdentifierNode;

/**
 A thin wrapper around CPGrammar for setting up the math grammar.
*/
@interface EXPGrammar : NSObject

/**
 The configured grammar.
 */
@property (readonly) CPGrammar *grammar;

@end
