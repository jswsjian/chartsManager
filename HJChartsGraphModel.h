//
//  HJChartsGraphModel.h
//  hj
//
//  Created by jian huang on 2017/6/2.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJBasicModle.h"
#import "HJChartsEntryModle.h"
#import <UIKit/UIKit.h>


@interface HJChartsGraphModel : HJBasicModle

//数据元素数组
@property (nonatomic,strong) NSArray *entries;

//图形描述
@property (nonatomic,copy) NSString *label;


//图形分段颜色,一个则为单色
@property (nonatomic,strong)  NSArray *colors;
@end
