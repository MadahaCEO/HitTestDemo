//
//  CustomView.m
//  HitTestDemo
//
//  Created by Apple on 2018/9/21.
//  Copyright © 2018年 马大哈. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
{
    UIButton *button2;
}

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 0, 80, 80);
        button.backgroundColor = [UIColor redColor];
        [button setTitle:@"left" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];

        
        UIButton  *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(150, -40, 80, 80);
        button1.backgroundColor = [UIColor redColor];
        [button1 setTitle:@"middle" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];

        button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(280, 40, 80, 80);
        button2.backgroundColor = [UIColor redColor];
        [button2 setTitle:@"right" forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];

        
    }
    
    return self;
}



- (void)buttonClick:(UIButton *)button {
    
    NSLog(@"========== %@",button.currentTitle);
}


/*
 Case1: 点击button1 & button2 不在self的区域都有效
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //1.判断自己能否接收事件
    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }
    
    // 这里无需判断point是否在父View的bounds内，因为middleButton和rightButton部分区域超出的父View
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return self;
    
}



/*
 Case2: 点击button1不在self的区域《无》效
        点击button2不在self的区域《有》效
 
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //1.判断自己能否接收事件
    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }

    CGPoint newPoint = [self convertPoint:point toView:button2];
    if ([button2 pointInside:newPoint withEvent:event]) {
        return button2;
    }
    
    return [super hitTest:point withEvent:event];
}
*/





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
