//
//  HJChartsEntryModle.h
//  hj
//
//  Created by jian huang on 2017/6/2.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJBasicModle.h"

@interface HJChartsEntryModle : HJBasicModle
//****折线图部分****
//包括X 、Y、data、iconName
-(instancetype)initWithLineX:(double)X Y:(double)Y iconName:(NSString *)iconName data:(id)data;
-(instancetype)initWithLineX:(double)X Y:(double)Y;
/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  x轴数值
 */
@property (nonatomic,assign) double x;
/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  Y轴数值
 */
@property (nonatomic,assign) double y;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  图标名称
 */
@property (nonatomic,strong) NSString *iconName;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  携带数据对象
 */
@property (nonatomic,strong) id data;


//*****柱状图***
//包括X 、Y、values、data、iconName、label
-(instancetype)initWithBarX:(double)X values:(NSArray <NSNumber *>*)values label:(NSString *)label iconName:(NSString *)iconName data:(id)data;
-(instancetype)initWithBarX:(double)X Y:(double)Y label:(NSString *)label iconName:(NSString *)iconName data:(id)data;;
-(instancetype)initWithBarX:(double)X Y:(double)Y;
-(instancetype)initWithBarX:(double)X values:(NSArray <NSNumber *>*)values;
/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  柱状分段值
 */
@property (nonatomic,strong) NSArray *values;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  每段柱状的标签
 */
@property (nonatomic,strong) NSString *label;

//****K线图部分****

//包括X 、shadowH、shadowL、open、close、data、iconName
-(instancetype)initWithCandleX:(double)X iconName:(NSString *)iconName data:(id)data shadowH:(double)shadowH shadowL:(double)shadowL open:(double)open close:(double)close;
-(instancetype)initWithCandleX:(double)X shadowH:(double)shadowH shadowL:(double)shadowL open:(double)open close:(double)close;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  最高值
 */
@property (nonatomic,assign) double shadowH;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  最低值
 */
@property (nonatomic,assign) double shadowL;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  开盘值
 */
@property (nonatomic,assign) double open;

/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  收盘值
 */
@property (nonatomic,assign) double close;

//****饼状图部分****
//包括value、data、iconName、label
-(instancetype)initWithPieIconName:(NSString *)iconName data:(id)data label:(NSString *)label value:(double)value;

-(instancetype)initWithPieValue:(double)value;
/**
 *  @Author 黄坚, 2017-3-17 9:00:37
 *
 *  饼、雷达图值
 */
@property (nonatomic,assign) double value;


//****雷达图部分****
//包括value、data
-(instancetype)initWithRadarData:(id)data label:(NSString *)label value:(double)value;
-(instancetype)initWithRadarValue:(double)value;

@end
