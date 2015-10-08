//
//  ViewController.m
//  Rollingball
//
//  Created by Do Minh Hai on 10/8/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle;
    CGFloat ballRadius;
     bool daoBong  ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBall];
    angle=0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rollBall) userInfo:nil repeats:true];
    }
-(void) addBall
{
    CGSize mainViewSize = self.view.bounds.size;
    
    ball= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Soccer.png"]];
    ballRadius = 48.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    [self.view addSubview:ball];
    
}
-(void) rollBall
{
   
    CGSize mainViewSize = self.view.bounds.size;
    if (ball.center.x >= mainViewSize.width - ballRadius) {
        daoBong = NO;
    }
    if (ball.center.x <= ballRadius) {
        daoBong = YES;
    }
    if (daoBong == YES) {
        CGFloat deltaAngle = 0.1;
        angle += deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x + ballRadius*deltaAngle, ball.center.y);

    }else
    {
        CGFloat deltaAngle = 0.1;
        angle -= deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x - ballRadius*deltaAngle, ball.center.y);
    }
}

@end
