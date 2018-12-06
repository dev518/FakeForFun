//
//  UIView+Image.m
//  FakeForFun
//
//  Created by wudi on 2018/12/6.
//  Copyright © 2018 wudi. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIView (Image)
- (UIImage *)viewToImage {
    CGSize size = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
