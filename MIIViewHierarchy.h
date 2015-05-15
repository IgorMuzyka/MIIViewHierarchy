//
//  MIIViewHierarchy.h
//
//
//  Created by Igor Muzyka on 5/15/15.
//  Copyright (c) 2015 Igor Muzyka. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR

    #import <UIKit/UIKit.h>
    #define MIIView UIView
    #define MIIImage UIImage
    #define MIIColor UIColor
    #define MIIRect CGRect

#elif TARGET_OS_MAC

    #import <Cocoa/Cocoa.h>
    #define MIIVIew NSView
    #define MIIImage NSImage
    #define MIIColor NSColor
    #define MIIRect NSRect

#endif

@interface MIIViewHierarchy : NSObject

@property (nonatomic, weak) MIIView *view;
@property (nonatomic, strong, readonly) NSArray *subviews;
@property (nonatomic, weak, readonly) NSArray *constraints;
@property (nonatomic) MIIRect frame;
@property (nonatomic) MIIRect bounds;
@property (nonatomic, weak) MIIColor *backgroundColor;
@property (nonatomic, weak) MIIColor *tintColor;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) BOOL userInteractionEnabled;
@property (nonatomic) BOOL hidden;

- (instancetype)initWithView:(MIIView *)view;
+ (instancetype)hierarchyWithView:(MIIView *)view;

@end

@interface MIIView (MIIViewHierarchy)

@property (nonatomic, readonly) MIIViewHierarchy *hierarchy;

@end