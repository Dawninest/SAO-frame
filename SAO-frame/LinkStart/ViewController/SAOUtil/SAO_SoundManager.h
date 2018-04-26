//
//  SAO_SoundManager.h
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/26.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SAO_SoundManager : NSObject

/*
 soundType :
    launch_pop / launch_miss
    feedback
    menu
    panel
    message
    warn
 */

+ (BOOL)playMusic:(NSString *)soundType Loop:(BOOL)needLoop;//播放音乐

+ (void)pauseMusic:(NSString *)filename;//暂停播放

+ (void)stopMusic:(NSString *)filename;//停止音乐

@end
