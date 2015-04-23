//
//  Cell.m
//  Recipes
//
//  Created by mmp001 on 4/19/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "Cell.h"

@implementation Cell
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont boldSystemFontOfSize:35.0];
        self.label.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.label];;
    }
    return self;
}
*/
//- (IBAction)closeButton:(UIButton *)sender {
//    NSLog(@"button clicked");
//}

- (void)drawRect:(CGRect)rect
{
    // inset by half line width to avoid cropping where line touches frame edges
    CGRect insetRect = CGRectInset(rect, 0.5, 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:rect.size.height/2.0];
    
    // white background
    [[UIColor whiteColor] setFill];
    [path fill];
    
    // red outline
    [[UIColor redColor] setStroke];
    [path stroke];
}

- (CGSize)intrinsicContentSize
{
    CGSize size = [self.ingredientLabel intrinsicContentSize];
    
    CGSize _extraMargins = CGSizeMake(5.0, 5.0);
    
    if (CGSizeEqualToSize(_extraMargins, CGSizeZero))
    {
        // quick and dirty: get extra margins from constraints
        for (NSLayoutConstraint *constraint in self.constraints)
        {
            if (constraint.firstAttribute == NSLayoutAttributeBottom || constraint.firstAttribute == NSLayoutAttributeTop)
            {
                // vertical spacer
                _extraMargins.height += [constraint constant];
            }
            else if (constraint.firstAttribute == NSLayoutAttributeLeading || constraint.firstAttribute == NSLayoutAttributeTrailing)
            {
                // horizontal spacer
                _extraMargins.width += [constraint constant];
            }
        }
    }
    
    // add to intrinsic content size of label
    size.width += _extraMargins.width;
    size.height += _extraMargins.height;
    
    return size;
}


@end
