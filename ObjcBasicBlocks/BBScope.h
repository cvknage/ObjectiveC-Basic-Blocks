//
//  BBScope.h
//  ObjectiveC Basic Blocks
//
//  Created by Christophe Knage on 11/12/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

/**
 * These mactos are based on the "libextobjc" implementation, but with a key difference.
 *
 * The key difference is that variable arguments are NOT supported.
 * This allows the macros to be much simpler and easier to maintain.
 *
 * The syntax for @weakify and @strongity is similar to the one used by "libextobjc",
 * whish means that these macros can easily be replaced by "libextobjc".
 *
 * @see Original implementation: https://github.com/jspahrsummers/libextobjc
 */

/**
 * Creates \c __weak shadow variabel for the variabel provided as
 * argument, which can later be made strong again with #strongify.
 *
 * This is typically used to weakly reference a variabel in a block, but then
 * ensure that the variabel stay alive during the actual execution of the block
 * (if they were live upon entry).
 *
 * See #strongify for an example of usage.
 */
#define weakify(V) \
try {} @finally {} \
__weak typeof(V) V ## _weak_ = V

/**
 * Strongly references the variabel provided as argument, which must
 * have previously been passed to #weakify.
 *
 * The strong reference created will shadow the original variabel name, such
 * that the original name can be used without issue (and a significantly
 * reduced risk of retain cycles) in the current scope.
 *
 * @code
 
 id foo = [[NSObject alloc] init];
 
 @weakify(foo);
 
 // this block will not keep 'foo' alive
 BOOL (^matchesFooOrBar)(id) = ^ BOOL (id obj){
 // but now, upon entry, 'foo' will stay alive until the block has
 // finished executing
 @strongify(foo);
 
 return [foo isEqual:obj];
 };
 
 * @endcode
 */
#define strongify(V) \
try {} @finally {} \
__strong typeof(V) V = V ## _weak_
