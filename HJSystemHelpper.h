//
//  HJSystemHelpper.h
//  hj
//
//  Created by jian huang on 2017/4/13.
//  Copyright © 2017年 hj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define NOTI_NET_DID_CHANGE @"NetDidChangeNotification"


@interface HJSystemHelpper : NSObject


+(instancetype)sharedInstance;

//如system.text
-(NSString *)getSystemConfigWithPath:(NSString *)path;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  网络监测
 */
-(void)clickNetworkReachabilityStatus;



@end
