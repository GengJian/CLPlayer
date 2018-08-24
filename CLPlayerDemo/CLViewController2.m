//
//  CLViewController2.m
//  CLPlayerDemo
//
//  Created by JmoVxia on 2017/8/2.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "CLViewController2.h"
#import "CLPlayerView.h"
#import "UIView+CLSetRect.h"
@interface CLViewController2 ()
/**CLplayer*/
@property (nonatomic,weak) CLPlayerView *playerView;
@end

@implementation CLViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"pushViewController";
    
    CLPlayerView *playerView = [[CLPlayerView alloc] initWithFrame:CGRectMake(0, 90, self.view.CLwidth, 300)];
    
    _playerView = playerView;
    [self.view addSubview:_playerView];
   
    [_playerView updateWithConfig:^(CLPlayerViewConfig *config) {
        //全屏是否隐藏状态栏，默认一直不隐藏
        config.fullStatusBarHiddenType = FullStatusBarHiddenFollowToolBar;
        //后台返回是否继续播放
        config.backPlay = NO;
        //转子颜色
        config.strokeColor = [UIColor redColor];
        //工具条消失时间，默认10s
        config.toolBarDisappearTime = 8;
        //顶部工具条隐藏样式，默认不隐藏
        config.topToolBarHiddenType = TopToolBarHiddenSmall;
    }];
    
    //视频地址
    _playerView.url = [NSURL URLWithString:@"http://220.249.115.46:18080/wav/day_by_day.mp4"];
    //播放
    [_playerView playVideo];
    //返回按钮点击事件回调,小屏状态才会调用，全屏默认变为小屏
    [_playerView backButton:^(UIButton *button) {
        NSLog(@"返回按钮被点击");
    }];
    //播放完成回调
    [_playerView endPlay:^{
        NSLog(@"播放完成");
    }];
    
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(0, 450, 90, 90)];
    [but setTitle:@"切换视频" forState:UIControlStateNormal];
    but.backgroundColor = [UIColor lightGrayColor];
    but.CLcenterX = self.view.CLcenterX;
    [but addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
- (void)next{
    _playerView.url = [NSURL URLWithString:@"http://wvideo.spriteapp.cn/video/2016/1203/58425ad2a0c1d_wpd.mp4"];
    [_playerView playVideo];
}
-(void)viewDidDisappear:(BOOL)animated{
    [_playerView destroyPlayer];
}







@end
