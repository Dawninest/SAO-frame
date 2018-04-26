//
//  SAO_SoundManager.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/26.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "SAO_SoundManager.h"
#import <AVFoundation/AVFoundation.h>

@interface SAO_SoundManager ()


@end



@implementation SAO_SoundManager

/**
 * 存放所有的音乐播放器
 */
static NSMutableDictionary *_musicPlayers;

+ (NSMutableDictionary *)musicPlayers{
    if (_musicPlayers == nil) {
        _musicPlayers = [NSMutableDictionary dictionary];
    }
    return _musicPlayers;
}

+ (BOOL)playMusic:(NSString *)soundType Loop:(BOOL)needLoop{
    NSString *filename = [self getSoundFileByType:soundType];
    if (!filename) return NO;
    AVAudioPlayer *player = [self musicPlayers][filename];
    if (!player) {
        NSURL *url=[[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return NO;
        //创建播放器
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        //缓冲
        if (![player prepareToPlay]) return NO;//如果缓冲失败，那么就直接返回
        //存入字典
        [self musicPlayers][filename] = player;
        if(needLoop){
            [player setNumberOfLoops:-1];//设置循环播放
        }
        
        //player.volume = 1;//声音大小
    }
    //播放
    if (![player isPlaying]) {
        return [player play];//如果当前没处于播放状态，那么就播放
    }
    return YES;//正在播放
}

+ (void)pauseMusic:(NSString *)filename{
    if (!filename) return;
    AVAudioPlayer *player=[self musicPlayers][filename];
    [player pause];
}

+ (void)stopMusic:(NSString *)filename{
    if (!filename) return;
    AVAudioPlayer *player=[self musicPlayers][filename];
    [player stop];
    [[self musicPlayers] removeObjectForKey:filename];
}

+ (NSString *)getSoundFileByType:(NSString *)fileType{
    NSDictionary *typeToFile = @{@"launch_pop":@"Popup.SAO.Launcher.wav",
                                 @"launch_miss":@"Dismiss.SAO.Launcher.wav",
                                 @"feedback":@"Feedback.SAO.Click.wav",
                                 @"menu":@"Popup.SAO.Menu.wav",
                                 @"panel":@"Popup.SAO.Panel.wav",
                                 @"message":@"Popup.SAO.Message.wav",
                                 @"warn":@"Popup.SAO.Warn.wav"};
    return typeToFile[fileType];
}



@end
