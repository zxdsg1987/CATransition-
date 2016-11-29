//
//  ViewController.m
//  转场动画
//
//  Created by skywalker on 16/11/29.
//  Copyright © 2016年 斯芬克斯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,assign)NSInteger index;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index=1;
    //向前一张
    UISwipeGestureRecognizer * swipLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    [swipLeft setDirection: UISwipeGestureRecognizerDirectionLeft];
    [self.imageView addGestureRecognizer:swipLeft];
    //向后一张
    
    UISwipeGestureRecognizer *swipRight =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(cube:)];
    [swipRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.imageView addGestureRecognizer:swipRight];
    
    
    UISwipeGestureRecognizer * swipUp=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(reveal:)];
    [swipUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.imageView addGestureRecognizer:swipUp];
    
    
    
    UISwipeGestureRecognizer * swipDown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(pageUnCurl:)];
    [swipDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.imageView addGestureRecognizer:swipDown];
    
    
}
#pragma mark -扫手势
-(void)swip:(UISwipeGestureRecognizer*)swipGesture{
      //核心动画
    UIViewAnimationOptions options;
    if (swipGesture.direction ==UISwipeGestureRecognizerDirectionLeft ) {
        self.index--;
        options=UIViewAnimationOptionTransitionFlipFromRight ;
    }else if(swipGesture.direction ==UISwipeGestureRecognizerDirectionRight){
        self.index++;
        options=UIViewAnimationOptionTransitionFlipFromLeft;
    }
    //读取图片
    if (self.index>9) {
        self.index=1;
    }else if(self.index<1)
    {
        self.index=9;
    }
    NSString * imageName=[NSString stringWithFormat:@"commom-%zd",self.index];
    [UIView transitionWithView:self.imageView duration:1.0 options:options animations:^{
        self.imageView.image=[UIImage imageNamed:imageName];
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark -块效果
-(void)cube:(UISwipeGestureRecognizer*)swipGesture{
    CATransition * transition=[CATransition animation];
    transition.type=@"cube";
    
    if (swipGesture.direction ==UISwipeGestureRecognizerDirectionLeft ) {
        self.index--;
        transition.subtype=kCATransitionFromRight;
        
    }else if(swipGesture.direction ==UISwipeGestureRecognizerDirectionRight){
        self.index++;
     transition.subtype=kCATransitionFromLeft;
    }
    //读取图片
    if (self.index>9) {
        self.index=1;
    }else if(self.index<1)
    {
        self.index=9;
    }
    NSString * imageName =[NSString stringWithFormat:@"commom-%zd",self.index];
    self.imageView.image=[UIImage imageNamed:imageName];
    [self.imageView.layer addAnimation:transition forKey:nil];
}
#pragma mark -reveal
-(void)reveal:(UISwipeGestureRecognizer *)swipgGesture{
    CATransition * transition=[CATransition animation];
    transition.type=@"reveal";
    if (swipgGesture.direction ==UISwipeGestureRecognizerDirectionUp) {
        self.index--;
        transition.subtype=kCATransitionFromTop;
        
    }else if(swipgGesture.direction ==UISwipeGestureRecognizerDirectionDown){
        self.index++;
        transition.subtype=kCATransitionFromBottom;
    }

    if (self.index>9) {
        self.index=1;
    }else if(self.index<1)
    {
        self.index=9;
    }

    NSString * imageName =[NSString stringWithFormat:@"commom-%zd",self.index];
    self.imageView.image=[UIImage imageNamed:imageName];
    [self.imageView.layer addAnimation:transition forKey:nil];

}
#pragma mark -pageUnCurl
-(void)pageUnCurl:(UISwipeGestureRecognizer *)swipgGesture{
    CATransition * transition=[CATransition animation];
    transition.type=@"pageUnCurl";
    if (swipgGesture.direction ==UISwipeGestureRecognizerDirectionUp) {
        self.index--;
        transition.subtype=kCATransitionFromTop;
        
    }else if(swipgGesture.direction ==UISwipeGestureRecognizerDirectionDown){
        self.index++;
        transition.subtype=kCATransitionFromBottom;
    }
    
    if (self.index>9) {
        self.index=1;
    }else if(self.index<1)
    {
        self.index=9;
    }
    
    NSString * imageName =[NSString stringWithFormat:@"commom-%zd",self.index];
    self.imageView.image=[UIImage imageNamed:imageName];
    [self.imageView.layer addAnimation:transition forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
